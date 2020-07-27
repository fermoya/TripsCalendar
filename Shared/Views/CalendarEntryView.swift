//
//  CalendarEntryView.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import SwiftUI

struct CalendarEntryView: View {
    var trip: Trip

    var body: some View {
        HStack(spacing: 10) {
            dateBubble
            contentDescription
            Spacer()
            if trip.isOngoing {
                ongoingBubble
            }
        }
        .foregroundColor(Color.primaryColor)
        .padding(.horizontal, 4)
        .background(backgroundImage)
        .cornerRadius(10)
        .clipped()
    }

    var ongoingBubble: some View {
        Text("On trip")
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
            .font(.caption)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(foregroundColor))
    }

    var backgroundImage: some View {
        let image = UIImage(named: trip.image) ?? UIImage.placeholder
        return Image(uiImage: image)
            .aspectRatio(contentMode: .fill)
            .overlay(ContainerRelativeShape().fill(Color.white.opacity(0.6)))
    }

    var contentDescription: some View {
        VStack(alignment: .leading) {
            Text(trip.city)
                .font(.headline)
            Text(trip.propertyName)
                .font(.subheadline)
            Text(trip.propertyAddress)
                .font(.callout)
        }
    }

    var foregroundColor: Color {
        trip.isOngoing ? Color.accentColor : Color.darkGray
    }

    var backgroundColor: Color {
        trip.isOngoing ? Color.primaryColor : Color.lightGray
    }

    var dateBubble: some View {
        VStack {
            Text(trip.arrivalDate.day)
                .font(.headline)
            Text(trip.arrivalDate.month)
                .font(.subheadline)
        }
        .foregroundColor(foregroundColor)
        .padding()
        .background(backgroundColor)
        .clipShape(Circle())
    }
}


struct CalendarEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarEntryView(trip: nextTrips[0])
            CalendarEntryView(trip: nextTrips[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
