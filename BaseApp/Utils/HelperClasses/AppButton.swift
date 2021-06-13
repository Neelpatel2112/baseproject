//
//  AppButton.swift
//  DilanGoRider
//
//  Created by iMac on 08/01/21.
//

import Foundation
import UIKit

class AppButton: UIButton {

    var shadowAdded: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    func setUp(){
        self.backgroundColor = UIColor.App_Orange
        self.setTitleColor(UIColor.APP_GradiantDarkBlue, for: .normal)
        self.titleLabel?.font = UIFont(name: AppFontName.Medium.rawValue, size: Global.shared.setCustomFontSize(size: 20))
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        if shadowAdded || self.isHidden == true {return}
        shadowAdded = true
        self.layer.cornerRadius = self.frame.height / 2
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.layer.shadowOpacity = 1.0
        shadowLayer.layer.shadowRadius = 15.0
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
    func setDisable()  {
        self.backgroundColor = UIColor.App_Gray
        self.isEnabled = false
    }
    
    func setEnable(){
        self.backgroundColor = UIColor.App_Orange
        self.isEnabled = true
    }
    
}
