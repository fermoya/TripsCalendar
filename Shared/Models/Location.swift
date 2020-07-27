//
//  Location.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import Foundation
import CoreLocation

struct Location: Codable, Equatable {
    var latitude: Double
    var longitude: Double
}

extension Location {
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
