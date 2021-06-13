//
//  VerifyOTPRequestModel.swift
//  DilanGoDriver
//
//  Created by iMac on 25/02/21.
//

import Foundation

struct VerifyOTPRequestModel:Codable {
    
    var otp   :String?
    var type  :OTPType.RawValue
    var mobileno: String?
    var mobile_code:String? = "+94"
}
