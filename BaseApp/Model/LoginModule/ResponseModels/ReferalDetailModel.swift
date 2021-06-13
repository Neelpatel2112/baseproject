//
//  ReferalDetailModel.swift
//  Dilango-Rider
//
//  Created by iMac on 22/03/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation


struct ReferaldetailModel : Codable {
    
    let displaymessage : String?
    let note : String?
    let referralImage : String?
    let referralImageLarge : String?
    let sharemessage : String?
    
    enum CodingKeys: String, CodingKey {
        case displaymessage = "displaymessage"
        case note = "note"
        case referralImage = "referral_image"
        case referralImageLarge = "referral_image_large"
        case sharemessage = "sharemessage"
    }
    
    init(from decoder: Decoder) throws {
        let values          = try decoder.container(keyedBy: CodingKeys.self)
        displaymessage      = try? values.decodeIfPresent(String.self, forKey: .displaymessage)
        note                = try? values.decodeIfPresent(String.self, forKey: .note)
        referralImage       = try? values.decodeIfPresent(String.self, forKey: .referralImage)
        referralImageLarge  = try? values.decodeIfPresent(String.self, forKey: .referralImageLarge)
        sharemessage        = try? values.decodeIfPresent(String.self, forKey: .sharemessage)
    }
    
}
