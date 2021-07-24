//
//  Date+.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 24/7/2564 BE.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "MMM yyyy"
        return dateFomatter.string(from: self)
    }
}
