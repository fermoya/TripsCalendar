//
//  NextTripEntryView.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import SwiftUI

struct NextTripEntryView: View {
    var entry: NextTripProvider.Entry

    var body: some View {
        if let trip = entry.trip {
            NextBookingView(trip: trip)
                .widgetURL(URL(string: String(format: URL.appDetailsUrlFormat, trip.reference)))
        } else {
            Text("You have no trips").font(.largeTitle)
                .widgetURL(URL(string: URL.appHomeUrl))
        }
    }
}
