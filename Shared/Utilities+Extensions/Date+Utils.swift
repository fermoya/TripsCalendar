//
//  Date+Utils.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import Foundation

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }

    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }

    static var now: Date { Date() }

    func trimmingTime() -> Date {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.formatOptions = [.withFullDate]

        let dateString = dateFormatter.string(from: self)
        return dateFormatter.date(from: dateString)!
    }
}
