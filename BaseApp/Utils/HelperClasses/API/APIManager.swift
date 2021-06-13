//
//  APIManager.swift
//  DilanGoRider
//
//  Created by iMac on 25/01/21.
//

import Foundation
import Moya

class APIManager {
    let Provider = MoyaProvider<NetworkServices>()
    private static var instance = APIManager()
    
    
    public static var shared: APIManager {
        return instance
    }
    
    //MARK:- Login
    func login(loginRequest:LoginRequestModel,finalresult:@escaping (Result<LoginResponseModel,ErrorModel>)-> Void) {
        Provider.request(.login(request: loginRequest)) { (response) in
            self.processResponse(result: response, completion: finalresult)
        }
    }
    //MARK:- forgetPassword
    func forgetPassword(forgetpasswordRequest:ForgetPasswordRequestModel, finalresult:@escaping (Result<LoginResponseModel,ErrorModel>)-> Void){
        Provider.request(.forgotPassword(forgetrequest: forgetpasswordRequest)) { (response) in
            self.processResponse(result: response, completion: finalresult)
        }
    }
    

}
extension APIManager {
    func processResponse<T>(result:Result<Moya.Response,MoyaError>,completion: (Result<T,ErrorModel>) -> ()) where T: Codable {
        switch result {
        case .success(let response):
            do {
                print(try response.mapJSON())
            }catch(let error) {
                print(error)
            }
            switch response.statusCode {
            case 200...209:
              //  print(response.statusCode)
                do {
                    let json = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(json))
                }catch (let error) {
                    completion(.failure(ErrorModel.unknown(error: error.localizedDescription)))
                }
            case 401...499:
                UserDefaultsManager.shared.SetIsUserLogin(islogin: false)
                let alert = UIAlertController(title: "", message: ErrorModel.unauthorized.description(), preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default)
                alert.addAction(ok)
                CustomTimer.invalidateAllTimers()
                Provider.session.cancelAllRequests()                
                APP_DELEGETE?.SetupIntials()
                if let topvc = UIApplication.topViewController() {
                    topvc.present(alert, animated: true, completion: nil)
                }
            case 500...599:
                completion(.failure(ErrorModel.serverError))
            default:
                completion(.failure(ErrorModel.serverError))
            }
        case .failure(let error):
            completion(.failure(.unknown(error: error.localizedDescription)))
        }
    }
}
