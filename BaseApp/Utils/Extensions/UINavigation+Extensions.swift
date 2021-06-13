//
//  UINavigation+Extensions.swift
//  DilanGoRider
//
//  Created by iMac on 08/01/21.
//

import Foundation
import UIKit
extension UINavigationController{
    ///Hide navigation bar with Animation
    func hideNavigationBar(){
        self.setNavigationBarHidden(true, animated: true)
    }
    ///Show navigation bar with Animation
    func showNavigationBar() {
        self.setNavigationBarHidden(false, animated: true)
    }
    
    ///For Transparent Naviagation bar
    func setTransparentNaviagationBar(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true

    }
    func SetColorNavigationbar(Color:UIColor) {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.barTintColor = Color
    }
    
    /// set Attributed Title
    func setAttributedTitle(){
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: AppFontName.Bold.rawValue, size: AppFontSize.FONTS_SIZE28.rawValue)!]
    }
    
    /// Set Clear navigation Bar
    func setClearNavaigationBar(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}
