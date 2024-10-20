//
//  Extensions.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/20/24.
//

import Foundation

extension Date {
    var relativeDescription: String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(self) {
            return "Today"
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else if calendar.isDateInTomorrow(self) {
            return "Tomorrow"
        } else {
            let components = calendar.dateComponents([.day, .month, .year], from: self, to: now)
            
            if let years = components.year, years > 0 {
                return "\(years) year\((years > 1) ? "s" : "") ago"
            } else if let months = components.month, months > 0 {
                return "\(months) month\((months > 1) ? "s" : "") ago"
            } else if let days = components.day, days < 30 && days > 0 {
                return "\(days) day\((days > 1) ? "s" : "") ago"
            } else if let days = components.day, days < 0 {
                let days = -days + 1
                return "\(days) day\((days > 1) ? "s" : "") ahead"
            }
        }
        return "Some time ago" // Fallback for any edge cases
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isTodayOrYesterday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self) || calendar.isDateInYesterday(self)
    }
    
    var timeDescription: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mma"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        return formatter.string(from: self).lowercased()
    }
    
    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        let day = Calendar.current.component(.day, from: self)
        
        var daySuffix: String
        switch day {
        case 1, 21, 31: daySuffix = "st"
        case 2, 22: daySuffix = "nd"
        case 3, 23: daySuffix = "rd"
        default: daySuffix = "th"
        }
        
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM") // Month format
        let monthString = dateFormatter.string(from: self)
        
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy") // Year format
        let yearString = dateFormatter.string(from: self)
        
        return "\(monthString) \(day)\(daySuffix), \(yearString)"
    }
    
    func isDateInThisWeek() -> Bool {
        let calendar = Calendar.current
        let today = Date()
        let todaysWeekday = calendar.component(.weekday, from: today) - 1
        let oneWeekAgo = calendar.date(byAdding: .day, value: -(todaysWeekday % 7), to: today)!
        
        return self >= oneWeekAgo
    }
    
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
