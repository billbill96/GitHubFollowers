//
//  String+.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 24/7/2564 BE.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFomatter.locale = Locale(identifier: "en_US_POSIX")
        dateFomatter.timeZone = .current
        
        return dateFomatter.date(from: self)
    }
    
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }

}
