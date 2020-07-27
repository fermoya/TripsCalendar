//
//  NextTripView.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import SwiftUI

struct NextBookingView: View {

    @Environment(\.widgetFamily) var widgetFamily
    var trip: Trip

    var body: some View {
        GeometryReader { proxy in
            HStack {
                NextTripDescriptionView(trip: trip)
                if widgetFamily != .systemSmall {
                    Image(uiImage: UIImage(named: trip.image) ?? .placeholder)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width / 2, height: proxy.size.width / 2)
                        .clipped()
                }
            }
        }
        .background(Color.primaryColor)
    }

}

struct NextBookingVersionTwoView_Previews: PreviewProvider {
    static var previews: some View {
        NextBookingView(trip: nextTrips[0])
    }
}
