//
//  Date+Extensions.swift
//  DilanGoDriver
//
//  Created by iMac on 30/01/21.
//

import Foundation

extension Date
{
    func getStringFromDate(formate: String, timeZone: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current//TimeZone(abbreviation: timeZone)
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: self)
        
    }
}
