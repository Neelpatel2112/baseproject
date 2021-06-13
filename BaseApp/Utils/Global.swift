//
//  Global.swift
//  Dilango-Rider
//
//  Created by PC on 25/02/21.
//  Copyright © 2021 PC. All rights reserved.
//

import Foundation
import UIKit

class Global {
    static var shared = Global()
    init(){}
    
    func setTextfieldFontsTypeWithSize(arrayt:[UITextField],size:UIFont? = UIFont.Body_1) {
        
        for txt in arrayt{
            txt.font = size
        }
    }
    func setLabelontsTypeWithSize(arrayt:[UILabel],size:UIFont? = UIFont.Body_Bold) {
        for txt in arrayt{
            txt.font = size
        }
    }
    func changePlaceHolderColor(textfields:[UITextField],color:UIColor) {
        for i in textfields {
            i.attributedPlaceholder = NSAttributedString(string: i.placeholder ?? "",
                                         attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
    func setCustomFontSize(size:CGFloat) -> CGFloat {
        var fontSize = size
        if UIDevice().screenType == .iPhones_4_4S || UIDevice().screenType == .iPhones_5_5s_5c_SE  {
            fontSize = (667*size)/812
        }
        if UIDevice().screenType == .iPhones_6_6s_7_8 {
            fontSize = (736*size)/812
        }
        if UIDevice().screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
            fontSize = (736*size)/812
        }
        if UIDevice().screenType == .iPhone_XSMax_ProMax {
           fontSize = (896*size)/812
        }
        if UIDevice().screenType == .iPhones_X_XS_12mini {
           fontSize = (812*size)/812
        }
        if UIDevice().screenType == .iPhone_XR_11 {
           fontSize = (896*size)/812
        }
        return fontSize
    }
    func currentAppVersion() -> String {
        return "Verison " +  "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "")"
    }
    
    func setData<T: Codable>(data: T, forKey key: String) {
        do {
            let jsonData = try JSONEncoder().encode(data)
            UserDefaults.standard.set(jsonData, forKey: key)
            UserDefaults.standard.synchronize()
        } catch let error {
            print(error)
        }
    }
    
    func getData<T: Codable>(objectType: T.Type, forKey key: String) -> T? {
        guard let result = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try JSONDecoder().decode(objectType, from: result)
        } catch let error {
            print(error)
            return nil
        }
    }
    //MARK:TimeStampToDate
    func TimeStampToDate(time:Double) -> (String,String) {
        let date = Date(timeIntervalSince1970: time)
        return (date.getStringFromDate(formate: "dd-MM-yyyy", timeZone: ""),date.getStringFromDate(formate: "hh:mm a", timeZone: ""))
    }
    
    func ShowTryAgainPopup(message:String,popupTitle:String,delegate:tryAgainTapProtocol) {
        let vc = TryAgainPopupViewController.init(nibName: "TryAgainPopupViewController", bundle: nil)
        vc.popupTitle = popupTitle
        vc.message = message
        vc.delegate = delegate
        vc.modalPresentationStyle = .overFullScreen
        if let topVC = UIApplication.topViewController() {
            topVC.present(vc, animated: false, completion: nil)
        }
    }
    
}

