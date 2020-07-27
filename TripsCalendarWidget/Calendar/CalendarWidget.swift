//
//  CalendarWidget.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import WidgetKit
import SwiftUI

struct CalendarPlaceholderView : View {
    var body: some View {
        CalendarWidgetEntryView(entry: CalendarEntry(date: .now,
                                                     trips: nextTrips))
            .redacted(reason: .placeholder)
    }
}

struct CalendarWidget: Widget {
    private let kind: String = "CalendarWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CalendarProvider(), placeholder: CalendarPlaceholderView()) { entry in
            CalendarWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Calendar")
        .description("See a calendar with all your trips")
        .supportedFamilies([.systemLarge])
    }
}

struct CalendarWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarWidgetEntryView(entry: CalendarEntry(date: .now, trips: Trip.emptyTrips))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            CalendarPlaceholderView()
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
