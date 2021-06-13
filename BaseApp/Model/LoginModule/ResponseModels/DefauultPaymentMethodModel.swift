//
//  DefauultPaymentMethodModel.swift
//  Dilango-Rider
//
//  Created by iMac on 22/03/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
struct DefauultPaymentMethodModel : Codable {
    
    let defaultType : String?
    let riderId : String?
    
    enum CodingKeys: String, CodingKey {
        case defaultType = "default_type"
        case riderId = "rider_id"
    }
    
    init(from decoder: Decoder) throws {
        let values  = try decoder.container(keyedBy: CodingKeys.self)
        defaultType = try? values.decodeIfPresent(String.self, forKey: .defaultType)
        riderId     = try? values.decodeIfPresent(String.self, forKey: .riderId)
    }
    
}
