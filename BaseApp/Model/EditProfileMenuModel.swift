//
//  EditProfileMenuModel.swift
//  DilanGoDriver
//
//  Created by iMac on 13/01/21.
//

import Foundation
import UIKit
struct EditProfileMenuModel {
    var Title:EditProfileMenuItems
}
enum EditProfileMenuItems:String {
    
    case Change_password           = "Change Password"
    
    func Itemimage() -> UIImage {
        switch self {
        case .Change_password:
            return Images.change_password.image()
        }
    }
}
