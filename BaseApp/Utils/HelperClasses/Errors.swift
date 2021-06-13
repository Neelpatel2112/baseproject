//
//  Errors.swift
//  DilanGoDriver
//
//  Created by iMac on 25/01/21.
//

import Foundation

enum ErrorModel:Error {
    
    case unauthorized
    case serverError
    case noInternet
    case enterOldPassword
    case enterNewPassword
    case passwordNotMatched
    case enterEmail
    case entervalidEmail
    case enterMobileNumber
    case enterFirstName
    case enterLastName
    case enterConfirmPassword
    case selectedPickAddress
    case selectedDropAddress
    case selectreasoncancelride
    case pleaseEnterCacnelReason
    case driverarebusy
    case DriverCancelRide
    case EnterFriendName
    case EnterFriendEmail
    case EnterFriendPhone
    
    case unknown(error: String)
    func description() -> String { 
        switch self {
        case .serverError:
            return errorMessage.serverErrror.rawValue
        case .unauthorized:
            return errorMessage.unauthorized.rawValue
        case .unknown(let error):
            return error
        case .noInternet:
            return errorMessage.Nointernetconnection.rawValue
        case .enterOldPassword:
            return errorMessage.enterOldPassword.rawValue
        case .enterNewPassword:
            return errorMessage.enterNewPassword.rawValue
        case .passwordNotMatched:
            return errorMessage.passwordNotMatched.rawValue
        case .enterEmail:
            return errorMessage.enterEmailAddress.rawValue
        case .entervalidEmail:
            return errorMessage.enterEmailAddress.rawValue
        case .enterMobileNumber :
            return errorMessage.enterMobileNo.rawValue
        case .enterFirstName:
            return errorMessage.enterFirstName.rawValue
        case .enterLastName:
            return errorMessage.enterLastName.rawValue
        case .enterConfirmPassword:
            return errorMessage.enterConfirmPassword.rawValue
        case .selectedPickAddress:
            return errorMessage.SelectedPickUpAddress.rawValue
        case .selectedDropAddress:
            return errorMessage.SelectedDropAddress.rawValue
        case .selectreasoncancelride:
            return errorMessage.selectreasoncancelride.rawValue
        case .pleaseEnterCacnelReason:
            return errorMessage.pleaseEnterCacnelReason.rawValue
        case .driverarebusy:
            return errorMessage.Drivers_are_busy.rawValue
        case .DriverCancelRide:
            return errorMessage.DriverCancelRide.rawValue
        case .EnterFriendName:
            return errorMessage.EnterFriendName.rawValue
        case .EnterFriendEmail:
            return errorMessage.EnterFriendEmail.rawValue
        case .EnterFriendPhone:
            return errorMessage.EnterFriendPhone.rawValue
        }
    }
}
