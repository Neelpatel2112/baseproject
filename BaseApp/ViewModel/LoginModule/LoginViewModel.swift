//
//  LoginViewModel.swift
//  Dilango-Rider
//
//  Created by iMac on 22/03/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
import SVProgressHUD
class LoginViewModel {
    
    func LoginUser(LoginRequest:LoginRequestModel,completion:@escaping(Result<Bool,ErrorModel>)->Void) {
        
        if LoginRequest.email == "" {
            completion(.failure(ErrorModel.unknown(error: errorMessage.enterEmailAddress.rawValue)))
        }else if LoginRequest.password == "" {
            completion(.failure(ErrorModel.unknown(error: errorMessage.EnterPassword.rawValue)))
        }else {
           // let encryptionRequest = LoginRequestModel(email: Global.shared.getEncryptString(LoginRequest.email), password: Global.shared.getEncryptedPassword(LoginRequest.password), device_id: LoginRequest.device_id, device_type: LoginRequest.device_type, checkalreadylogin: LoginRequest.checkalreadylogin, device_token: LoginRequest.device_token, loginfrom: LoginRequest.loginfrom)
            SVProgressHUD.show()
            APIManager.shared.login(loginRequest: LoginRequest) { (response) in
                SVProgressHUD.dismiss()
                switch response {
                case .success(let responsedata):
                    if responsedata.code == 0 {
                        UserDefaultsManager.shared.SetIsUserLogin(islogin: true)
                        UserDefaultsManager.shared.SetUserDetails(userData: responsedata.Logindata)
                        UserDefaultsManager.shared.SetoAuth(OauthData:responsedata.oauth )
                        UserDefaultsManager.shared.setUserEmailPassword(Email: responsedata.Logindata?.email ?? "", Password: responsedata.Logindata?.password ?? "")
                        completion(.success(true))
                    }else {
                        completion(.failure(ErrorModel.unknown(error: responsedata.message ?? "")))
                    }
                case .failure(let error):
                    completion(.failure(ErrorModel.unknown(error: error.localizedDescription)))
                }
            }
        }
    }
    func forgetPassword(mobileNO:String?,completion:@escaping(Result<Bool,Error>)->Void) {
        
        if mobileNO == "" {
            completion(.failure(ErrorModel.enterMobileNumber))
        }else {
            SVProgressHUD.show()
            let request = ForgetPasswordRequestModel(mobileno: mobileNO)
            APIManager.shared.forgetPassword(forgetpasswordRequest: request) { (response) in
                SVProgressHUD.dismiss()
                switch response {
                case .failure(let error):
                    completion(.failure(ErrorModel.unknown(error: error.description())))
                case .success:
                    completion(.success(true))
                }
            }
        }
        
    }
}
