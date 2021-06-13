//
//  LoginResponseModel.swift
//  DilanGoDriver
//
//  Created by iMac on 25/01/21.
//
import Foundation

struct LoginResponseModel : Codable {
    
    let code : Int?
    let Logindata : LoginDataModel?
    let error : Bool?
    let message : String?
    let oauth : OauthModel?
    let referaldetails : ReferaldetailModel?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case Logindata = "data"
        case error = "error"
        case message = "message"
        case oauth = "oauth"
        case referaldetails = "referaldetails"
    }
    
    init(from decoder: Decoder) throws {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
        code            = try? values.decodeIfPresent(Int.self, forKey: .code)
        Logindata       = try? values.decodeIfPresent(LoginDataModel.self, forKey: .Logindata)
        error           = try? values.decodeIfPresent(Bool.self, forKey: .error)
        message         = try? values.decodeIfPresent(String.self, forKey: .message)
        oauth           = try? values.decodeIfPresent(OauthModel.self, forKey: .oauth)
        referaldetails  = try? values.decodeIfPresent(ReferaldetailModel.self, forKey: .referaldetails)
    }
    
}


struct LoginDataModel : Codable {
    
    let address : String?
    let avgRating : Int?
    let canChangePassword : String?
    let chapchapmoney : String?
    let chapchapride : String?
    let city : String?
    let cooperativeId : String?
    let country : String?
    let countryCode : String?
    let countryMobileCode : String?
    let countryname : String?
    let defauultPaymentMethod : DefauultPaymentMethodModel?
    let driverDetail : [String]?
    var email : String?
    let endRideFlag : Int?
    var firstname : String?
    let houseNo : String?
    var image : String?
    let isSelfBook : String?
    let jsonAddresses : String?
    let language : String?
    let lastlogin : String?
    var lastname : String?
    let loginfrom : String?
    let middlename : String?
    let notifyUrl : String?
    let outstandingBalance : Int?
    let password : String?
    let pendingReview : String?
    var phone : String?
    let referalCode : String?
    let status : String?
    let streetName : String?
    let suburb : String?
    let suburbName : String?
    let userType : String?
    let userid : String?
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case avgRating = "avg_rating"
        case canChangePassword = "can_change_password"
        case chapchapmoney = "chapchapmoney"
        case chapchapride = "chapchapride"
        case city = "city"
        case cooperativeId = "cooperative_id"
        case country = "country"
        case countryCode = "country_code"
        case countryMobileCode = "country_mobile_code"
        case countryname = "countryname"
        case defauultPaymentMethod = "defauult_paymentMethod"
        case driverDetail = "driver_detail"
        case email = "email"
        case endRideFlag = "end_ride_flag"
        case firstname = "firstname"
        case houseNo = "house_no"
        case image = "image"
        case isSelfBook = "is_self_book"
        case jsonAddresses = "json_addresses"
        case language = "language"
        case lastlogin = "lastlogin"
        case lastname = "lastname"
        case loginfrom = "loginfrom"
        case middlename = "middlename"
        case notifyUrl = "notify_url"
        case outstandingBalance = "outstanding_balance"
        case password = "password"
        case pendingReview = "pending_review"
        case phone = "phone"
        case referalCode = "referal_code"
        case status = "status"
        case streetName = "street_name"
        case suburb = "suburb"
        case suburbName = "suburb_name"
        case userType = "user_type"
        case userid = "userid"
    }
    
    init(from decoder: Decoder) throws {
        let values              = try decoder.container(keyedBy: CodingKeys.self)
        address                 = try? values.decodeIfPresent(String.self, forKey: .address)
        avgRating               = try? values.decodeIfPresent(Int.self, forKey: .avgRating)
        canChangePassword       = try? values.decodeIfPresent(String.self, forKey: .canChangePassword)
        chapchapmoney           = try? values.decodeIfPresent(String.self, forKey: .chapchapmoney)
        chapchapride            = try? values.decodeIfPresent(String.self, forKey: .chapchapride)
        city                    = try? values.decodeIfPresent(String.self, forKey: .city)
        cooperativeId           = try? values.decodeIfPresent(String.self, forKey: .cooperativeId)
        country                 = try? values.decodeIfPresent(String.self, forKey: .country)
        countryCode             = try? values.decodeIfPresent(String.self, forKey: .countryCode)
        countryMobileCode       = try? values.decodeIfPresent(String.self, forKey: .countryMobileCode)
        countryname             = try? values.decodeIfPresent(String.self, forKey: .countryname)
        defauultPaymentMethod   = try? values.decodeIfPresent(DefauultPaymentMethodModel.self, forKey: .defauultPaymentMethod)
        driverDetail            = try? values.decodeIfPresent([String].self, forKey: .driverDetail)
        email                   = try? values.decodeIfPresent(String.self, forKey: .email)
        endRideFlag             = try? values.decodeIfPresent(Int.self, forKey: .endRideFlag)
        firstname               = try? values.decodeIfPresent(String.self, forKey: .firstname)
        houseNo                 = try? values.decodeIfPresent(String.self, forKey: .houseNo)
        image                   = try? values.decodeIfPresent(String.self, forKey: .image)
        isSelfBook              = try? values.decodeIfPresent(String.self, forKey: .isSelfBook)
        jsonAddresses           = try? values.decodeIfPresent(String.self, forKey: .jsonAddresses)
        language                = try? values.decodeIfPresent(String.self, forKey: .language)
        lastlogin               = try? values.decodeIfPresent(String.self, forKey: .lastlogin)
        lastname                = try? values.decodeIfPresent(String.self, forKey: .lastname)
        loginfrom               = try? values.decodeIfPresent(String.self, forKey: .loginfrom)
        middlename              = try? values.decodeIfPresent(String.self, forKey: .middlename)
        notifyUrl               = try? values.decodeIfPresent(String.self, forKey: .notifyUrl)
        outstandingBalance      = try? values.decodeIfPresent(Int.self, forKey: .outstandingBalance)
        password                = try? values.decodeIfPresent(String.self, forKey: .password)
        pendingReview           = try? values.decodeIfPresent(String.self, forKey: .pendingReview)
        phone                   = try? values.decodeIfPresent(String.self, forKey: .phone)
        referalCode             = try? values.decodeIfPresent(String.self, forKey: .referalCode)
        status                  = try? values.decodeIfPresent(String.self, forKey: .status)
        streetName              = try? values.decodeIfPresent(String.self, forKey: .streetName)
        suburb                  = try? values.decodeIfPresent(String.self, forKey: .suburb)
        suburbName              = try? values.decodeIfPresent(String.self, forKey: .suburbName)
        userType                = try? values.decodeIfPresent(String.self, forKey: .userType)
        userid                  = try? values.decodeIfPresent(String.self, forKey: .userid)
    }
    
}

