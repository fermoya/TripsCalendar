//
//  NextTripEntry.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import Foundation
import WidgetKit

struct NextTripEntry: TimelineEntry {
    var date: Date
    var trip: Trip?
    var relevance: TimelineEntryRelevance?
}
