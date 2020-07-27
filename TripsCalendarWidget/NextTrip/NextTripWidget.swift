//
//  NextTripWidget.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import WidgetKit
import SwiftUI

extension Trip {
    static let empty = Trip(reference: "XXXX", propertyName: "xxxxxxxxxxxx", propertyAddress: "xxxxxxxxxxxx", image: "", city: "XXXXX", arrivalDate: .now, departureDate: .now)
    static let emptyTrips = Array(repeating: Self.empty, count: 3)
}

struct NextTripPlaceholderView : View {
    var body: some View {
        NextTripEntryView(entry: NextTripEntry(date: .now,
                                               trip: .empty))
            .redacted(reason: .placeholder)
    }
}

struct NextTripWidget: Widget {
    private let kind: String = "NextTripWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: NextTripIntent.self, provider: NextTripProvider(), placeholder: NextTripPlaceholderView()) { (entry) in
            NextTripEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("Your next trip")
        .description("See your next trip.")
    }
}

struct NextTripWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextTripEntryView(entry: NextTripEntry(date: .now,
                                                   trip: nextTrips[0]))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            NextTripEntryView(entry: NextTripEntry(date: .now,
                                                   trip: nextTrips[0]))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            NextTripPlaceholderView()
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
