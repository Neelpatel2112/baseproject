//
//  WebService.swift
//  DilanGoDriver
//
//  Created by iMac on 25/01/21.
//

import Foundation
import Moya

enum NetworkServices {
    case login(request:LoginRequestModel)
    case forgotPassword(forgetrequest:ForgetPasswordRequestModel)
}

extension NetworkServices: TargetType {
    
    
    var baseURL: URL {
        return URL(string: "https://test.com/v2/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "userlogin2"
        case .forgotPassword:
            return "forgotpassword"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .forgotPassword :
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .login(let request) :
            return .requestParameters(parameters: request.asDictionary(), encoding: URLEncoding.default)
        
        case .forgotPassword(let forgetrequest):
            return .requestParameters(parameters: forgetrequest.asDictionary(), encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        
        switch self {
        case .login:
            return [:]
        case .forgotPassword :
            return UserDefaultsManager.shared.GetAPIHeader()
        }
    }
}
extension Dictionary {
    
    func getData() -> Data {
        var data = Data()
        do{
            data = try JSONSerialization.data(withJSONObject: self, options: [])
        }catch let error{
            print("Parameters not converted with error: \(error)")
        }
        return data
    }
}

