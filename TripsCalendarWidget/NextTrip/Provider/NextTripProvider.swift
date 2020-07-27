//
//  NextTripProvider.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import SwiftUI
import WidgetKit

struct NextTripProvider: IntentTimelineProvider {

    typealias Intent = NextTripIntent
    public typealias Entry = NextTripEntry

    func snapshot(for configuration: NextTripIntent, with context: Context, completion: @escaping (NextTripEntry) -> Void) {
        let entry = NextTripEntry(date: Date(), trip: nextTrips[0])
        completion(entry)
    }

    func timeline(for configuration: NextTripIntent, with context: Context, completion: @escaping (Timeline<NextTripEntry>) -> Void) {

        let intentTrip = configuration.trip
        let store = TripsStore()

        let trip = store.trips.first { $0.id.uuidString == intentTrip?.identifier } ?? store.trips.first

        let now = Date.now
        let tomorrow = now.addingTimeInterval(24 * 3600).trimmingTime()

        let score: Float = (trip?.isOngoing ?? false) ? 1 : 0
        let relevance = TimelineEntryRelevance(score: score)

        let entry = NextTripEntry(date: now, trip: trip, relevance: relevance)
        let timeline = Timeline(entries: [entry], policy: .after(tomorrow))
        completion(timeline)
    }
}

