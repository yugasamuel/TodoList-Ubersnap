//
//  DateRange.swift
//  TodoList
//
//  Created by Yuga Samuel on 04/08/23.
//

import Foundation

struct DateRange {
    static let value: ClosedRange<Date> = {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the start of the current year
        let startComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        guard let currentDay = calendar.date(from: startComponents) else {
            fatalError("Failed to get the start of the current year.")
        }
        
        // Get 1 year after the startComponents
        guard let oneYearAfterCurrentDay = calendar.date(byAdding: .year, value: 1, to: currentDay) else {
            fatalError("Failed to calculate one year after the start of the current year.")
        }
        
        return currentDay...oneYearAfterCurrentDay
    }()
}
