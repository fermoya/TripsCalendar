//
//  CalendarEntryView.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import SwiftUI
import WidgetKit

struct CalendarWidgetEntryView : View {
    var entry: CalendarProvider.Entry

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.white.opacity(0.8))
            if !entry.trips.isEmpty {
                VStack(spacing: 5) {
                    ForEach(entry.trips) { trip in
                        Link(destination: URL(string: String(format: URL.appDetailsUrlFormat, trip.reference))!) {
                            CalendarEntryView(trip: trip)
                                .padding(.horizontal, 8)
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 10)
            } else {
                Text("You have no trips").font(.largeTitle)
                    .widgetURL(URL(string: URL.appHomeUrl))
            }
        }
        .padding(3)
        .background(Color.accentColor)
    }
}

struct TripsCalendarWidget_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWidgetEntryView(entry: CalendarEntry(date: Date(), trips: nextTrips))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
