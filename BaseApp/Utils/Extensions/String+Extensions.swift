//
//  String+Extensions.swift
//  DilanGoDriver
//
//  Created by iMac on 11/01/21.
//

import Foundation


extension String {    
    
    func trim(to maximumCharacters: Int) -> String {
        return "\(self[..<index(startIndex, offsetBy: maximumCharacters)])" + "..."
    }
    
    func isValidEmail() -> Bool { // check Emailaddress valid or not
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func isValidMobileNumber() -> Bool { // check Mobile valid or not
        let testStrrr = self.trimmingCharacters(in: CharacterSet.whitespaces)
        if testStrrr.length < 10 {
            return false
        }
        let mobileRegex = "^([0-9]*)$"
        let mobileTemp = NSPredicate(format:"SELF MATCHES %@", mobileRegex)
        return mobileTemp.evaluate(with: testStrrr)
    }
    func isEmpty() -> Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespaces)
        return !trimmed.isEmpty
    }
    
    func isAlphabets()->Bool {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
            return true
        }else {
            return false
        }
    }
    func secondsToHoursMinutesSeconds() -> String {
        let minutes = self
        let floatMinutes = Float(minutes) ?? 0.0
        let hours = Int(floatMinutes / 60.0)
        let min = Int(floatMinutes.truncatingRemainder(dividingBy: 60.0))
        var strHour = "\(hours)"
        var strMin = "\(min)"
        if hours < 10
        {
            strHour = String(format: "0%d", hours)
        }
        if min < 10
        {
            strMin = String(format: "0%d", min)
        }
        let formatedTime = strHour +  ":" + strMin
        return formatedTime
    }
    
    var length: Int {
        return self.count
    }
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
    func getDateFromString(formate: String,timeZone:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
        dateFormatter.dateFormat = formate
        return dateFormatter.date(from: self)
    }
    func url() -> URL? {
        return URL(string: self)
    }
    func getDateFromTimeStemp(formate:String,timeZone: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self) ?? 0)
        return date.getStringFromDate(formate: formate, timeZone: timeZone)
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.00, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
