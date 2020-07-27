//
//  NextTripDescriptionView.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import SwiftUI

struct NextTripDescriptionView: View {
    var trip: Trip

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                VStack(alignment: .leading) {
                    Text(trip.city.uppercased())
                        .font(.system(.headline))
                    Text(tripDates)
                        .font(.system(.caption))
                }
                .padding(.bottom, 4)
                Text(trip.propertyName)
                    .font(.subheadline)
                Text(trip.propertyAddress)
                    .font(.caption)
                Spacer()
                HStack {
                    Spacer()
                    Text(trip.reference)
                        .font(.footnote)
                        .italic()
                }
            }
            .minimumScaleFactor(0.8)
            .foregroundColor(.white)
        }
        .padding()
    }

    var tripDates: String {
        "\(trip.arrivalDate.day) \(trip.arrivalDate.month) - \(trip.departureDate.day) \(trip.departureDate.month)"
    }
}
