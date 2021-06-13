//
//  LoginRequestModel.swift
//  DilanGoDriver
//
//  Created by iMac on 25/01/21.
//

import Foundation

struct LoginRequestModel:Codable {
    
    var email                       :String?
    var password                    :String?
    var device_id                   :String? = ""
    var device_type                 :String? = "I"
    var checkalreadylogin           :String? = "1"
    var device_token                :String?
    var loginfrom                   :String? = "N"
}
extension Encodable {
    func asDictionary()  -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return [:]
            }
            return dictionary
        }catch {
            print("not able to convert Dictionary")
            return [:]
            
        }
    }
}
