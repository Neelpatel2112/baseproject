//
//  AES.swift
//  Dilango-Rider
//
//  Created by Jenish on 01/04/21.
//  Copyright © 2021 PC. All rights reserved.
//https://pastebin.com/raw/h6gacaHX

import Foundation
import CommonCrypto

protocol Cryptable {
    func encrypt(_ string: String) throws -> Data
    func decrypt(_ data: Data) throws -> String
}

enum AESError: Error {
    case invalidKeySize
    case generateRandomIVFailed
    case encryptDataFailed
    case stringToDataFailed
    case decryptDataFailed
    case dataToStringFailed
}

struct AES {
    // Seems like the easiest way to avoid the `withUnsafeBytes` mess is to use NSData.bytes.
    private let key: NSData

    private let ivSize: Int                     = kCCBlockSizeAES128
    private let options: CCOptions              = CCOptions(kCCOptionPKCS7Padding)

    init(keyString: String) throws {
        guard keyString.count == kCCKeySizeAES256 else {
            throw AESError.invalidKeySize
        }
        guard let keyData: Data = keyString.data(using: .utf8) else {
            throw AESError.stringToDataFailed
        }
        self.key = NSData(data: keyData)
    }
}

extension AES: Cryptable {

    func encrypt(_ string: String) throws -> Data {
        guard let dataToEncrypt: Data = string.data(using: .utf8) else {
            throw AESError.stringToDataFailed
        }

        // Seems like the easiest way to avoid the `withUnsafeBytes` mess is to use NSData.bytes.
        let dataToEncryptNSData = NSData(data: dataToEncrypt)

        let bufferSize: Int = ivSize + dataToEncryptNSData.length + kCCBlockSizeAES128
        let buffer = UnsafeMutablePointer<NSData>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }

        // iv creation
        let status: Int32 = SecRandomCopyBytes(
            kSecRandomDefault,
            kCCBlockSizeAES128,
            buffer
        )
        guard status == 0 else {
            throw AESError.generateRandomIVFailed
        }

        var numberBytesEncrypted: Int = 0

        let cryptStatus: CCCryptorStatus = CCCrypt( // Stateless, one-shot encrypt operation
            CCOperation(kCCEncrypt),                // op: CCOperation
            CCAlgorithm(kCCAlgorithmAES),           // alg: CCAlgorithm
            options,                                // options: CCOptions
            key.bytes,                              // key: the "password"
            key.length,                             // keyLength: the "password" size
            buffer,                                 // iv: Initialization Vector
            dataToEncryptNSData.bytes,              // dataIn: Data to encrypt bytes
            dataToEncryptNSData.length,             // dataInLength: Data to encrypt size
            buffer + kCCBlockSizeAES128,            // dataOut: encrypted Data buffer
            bufferSize,                             // dataOutAvailable: encrypted Data buffer size
            &numberBytesEncrypted                   // dataOutMoved: the number of bytes written
        )

        guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
            throw AESError.encryptDataFailed
        }

        return Data(bytes: buffer, count: numberBytesEncrypted + ivSize)
    }

    func decrypt(_ data: Data) throws -> String {

        // Seems like the easiest way to avoid the `withUnsafeBytes` mess is to use NSData.bytes.
        let dataToDecryptNSData = NSData(data: data)

        let bufferSize: Int = dataToDecryptNSData.length - ivSize
        let buffer = UnsafeMutablePointer<NSData>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }

        var numberBytesDecrypted: Int = 0
        
        let cryptStatus: CCCryptorStatus = CCCrypt(         // Stateless, one-shot encrypt operation
            CCOperation(kCCDecrypt),                        // op: CCOperation
            CCAlgorithm(kCCAlgorithmAES128),                // alg: CCAlgorithm
            options,                                        // options: CCOptions
            key.bytes,                                      // key: the "password"
            key.length,                                     // keyLength: the "password" size
            dataToDecryptNSData.bytes,                      // iv: Initialization Vector
            dataToDecryptNSData.bytes + kCCBlockSizeAES128, // dataIn: Data to decrypt bytes
            bufferSize,                                     // dataInLength: Data to decrypt size
            buffer,                                         // dataOut: decrypted Data buffer
            bufferSize,                                     // dataOutAvailable: decrypted Data buffer size
            &numberBytesDecrypted                           // dataOutMoved: the number of bytes written
        )

        guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
            throw AESError.decryptDataFailed
        }

        let decryptedData = Data(bytes: buffer, count: numberBytesDecrypted)

        guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
            throw AESError.dataToStringFailed
        }

        return decryptedString
    }
}


//do {
//    let aes = try AES(keyString: "FiugQTgPNwCWUY,VhfmM4cKXTLVFvHFe")
//
//    let stringToEncrypt: String = "please encrypt meeee"
//    print("String to encrypt:\t\t\t\(stringToEncrypt)")
//
//    let encryptedData: Data = try aes.encrypt(stringToEncrypt)
//    print("String encrypted (base64):\t\(encryptedData.base64EncodedString())")
//
//    let decryptedData: String = try aes.decrypt(encryptedData)
//    print("String decrypted:\t\t\t\(decryptedData)")
//
//} catch {
//    print("Something went wrong: \(error)")
//}
