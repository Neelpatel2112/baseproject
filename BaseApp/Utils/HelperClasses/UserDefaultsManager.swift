//
//  UserDefaultsManager.swift
//  DilanGoRider
//
//  Created by iMac on 30/01/21.
//

import Foundation

class UserDefaultsManager: NSObject {
    
    static let shared   = UserDefaultsManager()
    private let Default = UserDefaults.standard
    
    func isKeyExistInPreference(key: String) -> Bool {
        if(UserDefaults.standard.object(forKey: key) == nil) {
            return false
        }
        return true
    }
    //MARK: GetISUserLogin
    func GetIsUserLogin() -> Bool {
        Default.bool(forKey: UserDefaultKey.IsLogin.rawValue)
    }
    //MARK: SetISUserLogin
    func SetIsUserLogin(islogin:Bool) {
        Default.setValue(islogin, forKey: UserDefaultKey.IsLogin.rawValue)
    }
    //MARK: SetUserEmailPassword
    func setUserEmailPassword(Email:String,Password:String) {
        Default.setValue(Email, forKey: UserDefaultKey.Email.rawValue)
        Default.setValue(Password, forKey: UserDefaultKey.password.rawValue)
    }
    //MARK: GetUserEmailPassword
    func GetUserEmailPassword() -> (email:String,password:String) {
        let email = Default.string(forKey: UserDefaultKey.Email.rawValue) ?? ""
        let Password = Default.string(forKey: UserDefaultKey.password.rawValue) ?? ""
        return (email,Password)
    }
    //MARK: GetUserDetails
    func GetUserDetails() -> LoginDataModel? {
        return Global.shared.getData(objectType: LoginDataModel.self, forKey: UserDefaultKey.UserDetails.rawValue)
    }
    //MARK: SetUserDetails
    func SetUserDetails(userData:LoginDataModel?) {
        guard let udata = userData else {
            return
        }
        Global.shared.setData(data: udata, forKey: UserDefaultKey.UserDetails.rawValue)
    }
    
    //MARK: GetoAuth
    func GetoAuth() -> OauthModel? {
        return Global.shared.getData(objectType: OauthModel.self, forKey: UserDefaultKey.oAuth.rawValue)
    }
    //MARK: SetoAuth
    func SetoAuth(OauthData:OauthModel?) {
        guard let OauthModel = OauthData else {
            return
        }
        Global.shared.setData(data: OauthModel, forKey: UserDefaultKey.oAuth.rawValue)
    }
    
    
    func GetAPIHeader() -> [String:String] {
        let loginString = NSString(format:"%@:%@",GetUserEmailPassword().email,GetUserEmailPassword().password)
        let loginData: Data = loginString.data(using: String.Encoding.utf8.rawValue)!
        let authValue = NSString(format: "Basic %@", loginData.base64EncodedString(options: []))
        return ["username": GetUserEmailPassword().email,
                "password":GetUserEmailPassword().password,
                "Authorization":authValue.description,
                "token":""]
    }
    
    //MARK: GetUserEmailPassword
    func GetCreditCardNameSessionId() -> (creditCardName:String,sessionId:String) {
        let creditCardName = Default.string(forKey: UserDefaultKey.creditCardName.rawValue) ?? ""
        let sessionId = Default.string(forKey: UserDefaultKey.sessionId.rawValue) ?? ""
        return (creditCardName,sessionId)
    }

    
    
    ///MARK:  getFirebaseEnable()
    func getFirebaseEnable() -> Bool {
        return Default.bool(forKey: UserDefaultKey.Firebase_enable.rawValue)
    }
    
    //MARK: getGeocoderOsmEnable()
    func getGeocoderOsmEnable() -> Bool {
        return Default.bool(forKey: UserDefaultKey.GeocoderOsm.rawValue)
    }
    
    //MARK: RemoveAllDetails()
    func RemoveAllDetails() {
        let domain = Bundle.main.bundleIdentifier ?? ""
        Default.removePersistentDomain(forName: domain)
        Default.synchronize()
        print(Array(Default.dictionaryRepresentation().keys).count)
    }
    //MARK:- set_utc_offset()
    func set_utc_offset(utc:String) {
        Default.setValue(utc, forKeyPath: UserDefaultKey.utc_offset.rawValue )
    }
    //MARK:- Get_utc_offset
    func Get_utc_offset() -> String {
        return Default.string(forKey: UserDefaultKey.utc_offset.rawValue) ?? ""
    }
    
    //MARK: APIHeaderForAddCard
    func GetAPIHeaderForAddCard() -> [String:String] {
        
        return ["name": GetCreditCardNameSessionId().creditCardName,
                "tokenId":GetCreditCardNameSessionId().sessionId]
    }
    //MARK: SetUserEmailPassword
    func setCreditCardNameSessionId(creditCardName:String,sessionId:String) {
        Default.setValue(creditCardName, forKey: UserDefaultKey.creditCardName.rawValue)
        Default.setValue(sessionId, forKey: UserDefaultKey.sessionId.rawValue)
    }

}
