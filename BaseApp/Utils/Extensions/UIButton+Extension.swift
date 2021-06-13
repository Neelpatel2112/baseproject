//
//  UIButton+Extension.swift
//  Dilango-Rider
//
//  Created by PC on 25/02/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setUpButton(backgroundColor:UIColor,borderWidth:CGFloat,borderColor:UIColor,cornerRadius:CGFloat,titleColor:UIColor)  {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
    func setDisableButton(backgroundColor:UIColor)  {
        self.setUpButton(backgroundColor: backgroundColor, borderWidth: 2, borderColor: UIColor.white, cornerRadius: self.frame.size.height / 2, titleColor: UIColor.white)
//        self.isEnabled = false
    }

    func setEnableButton(backgroundColor:UIColor){
        self.setUpButton(backgroundColor: backgroundColor, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: self.frame.size.height / 2, titleColor: UIColor.white)
//        self.isEnabled = true
    }
    
    func setAlignTextBelow(spacing: CGFloat) {
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.width - spacing), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font ?? 0.0])
            self.imageEdgeInsets = UIEdgeInsets(top: (titleSize.height - spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
}
