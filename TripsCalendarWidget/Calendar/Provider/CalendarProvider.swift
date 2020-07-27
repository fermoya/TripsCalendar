//
//  CalendarProvider.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import WidgetKit
import SwiftUI

struct CalendarProvider: TimelineProvider {
    public typealias Entry = CalendarEntry

    public func snapshot(with context: Context, completion: @escaping (CalendarEntry) -> ()) {
        let entry = CalendarEntry(date: Date(), trips: nextTrips)
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let store = TripsStore()

        let now = Date.now
        let tomorrow = now.addingTimeInterval(24 * 3600).trimmingTime()

        let entry = CalendarEntry(date: now, trips: store.trips)
        let timeline = Timeline(entries: [entry], policy: .after(tomorrow))
        completion(timeline)
    }
}
