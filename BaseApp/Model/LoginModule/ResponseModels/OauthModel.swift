//
//  OauthModel.swift
//  Dilango-Rider
//
//  Created by iMac on 22/03/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation

struct OauthModel : Codable {
    
    let accessToken : String?
    let expiresIn : Int?
    let scope : String?
    let tokenType : String?
    
    enum CodingKeys: String, CodingKey {
        
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case scope = "scope"
        case tokenType = "token_type"
    }
    
    init(from decoder: Decoder) throws {
        let values  =   try decoder.container(keyedBy: CodingKeys.self)
        accessToken =   try? values.decodeIfPresent(String.self, forKey: .accessToken)
        expiresIn   =   try? values.decodeIfPresent(Int.self, forKey: .expiresIn)
        scope       =   try? values.decodeIfPresent(String.self, forKey: .scope)
        tokenType   =   try? values.decodeIfPresent(String.self, forKey: .tokenType)
    }
    
}
