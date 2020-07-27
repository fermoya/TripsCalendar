//
//  CalendarEntry.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import Foundation
import WidgetKit

struct CalendarEntry: TimelineEntry {
    public let date: Date
    var trips: [Trip]
}
