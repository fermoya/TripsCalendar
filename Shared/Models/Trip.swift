//
//  Booking.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import Foundation
import MapKit

struct Trip: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var reference: String
    var propertyName: String
    var propertyAddress: String
    var image: String
    var city: String
    var arrivalDate: Date
    var departureDate: Date
    var location: Location = Location(latitude: 37.3230, longitude: 122.0322)
}

extension Trip {
    var annotation: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = city
        annotation.coordinate = location.coordinates
        return annotation
    }
}

extension Trip: Comparable {

    static func < (lhs: Trip, rhs: Trip) -> Bool {
        if lhs.arrivalDate < rhs.arrivalDate {
            return true
        } else if lhs.departureDate < rhs.departureDate {
            return true
        }
        return false
    }

}

extension Trip {
    var isOngoing: Bool {
        Calendar.current.compare(arrivalDate, to: Date(), toGranularity: .day) == .orderedSame ||
            (Calendar.current.compare(arrivalDate, to: Date(), toGranularity: .day) == .orderedAscending && (Calendar.current.compare(departureDate, to: Date(), toGranularity: .day) == .orderedDescending || Calendar.current.compare(departureDate, to: Date(), toGranularity: .day) == .orderedSame))
    }
}

let nextTrips = [
    Trip(reference: "12734-497774",
         propertyName: "Força Barça",
         propertyAddress: "C/Aleatorio 25",
         image: "barcelona",
         city: "Barcelona",
         arrivalDate: Date(),
         departureDate: Date().addingTimeInterval(24 * 3600 * 3),
         location: Location(latitude: 41.3851, longitude: 2.1734)),
    Trip(reference: "55091-231959",
         propertyName: "Le Moulin Rouge",
         propertyAddress: "Les Champs Elysees",
         image: "paris",
         city: "Paris",
         arrivalDate: Date().addingTimeInterval(24 * 3600 * 3),
         departureDate: Date().addingTimeInterval(24 * 3600 * 4),
         location: Location(latitude: 48.8566, longitude: 2.3522)),
    Trip(reference: "90734-347807",
         propertyName: "The Dubliner Hostel",
         propertyAddress: "1 Grafton St.",
         image: "dublin",
         city: "Dublin",
         arrivalDate: Date().addingTimeInterval(24 * 3600 * 7),
         departureDate: Date().addingTimeInterval(24 * 3600 * 10),
         location: Location(latitude: 53.3302, longitude: 6.3106)),
    Trip(reference: "34762-900106",
         propertyName: "The Stables Hotel",
         propertyAddress: "23 Queen's Crescent",
         image: "london",
         city: "London",
         arrivalDate: Date().addingTimeInterval(24 * 3600 * 15),
         departureDate: Date().addingTimeInterval(24 * 3600 * 20),
         location: Location(latitude: 51.5074, longitude: 0.1278))
]
