//
//  IntentHandler.swift
//  NextTripIntent
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import Intents

class IntentHandler: INExtension, NextTripIntentHandling {
    
    override func handler(for intent: INIntent) -> Any {
        return self
    }

    func provideTripOptionsCollection(for intent: NextTripIntent, with completion: @escaping (INObjectCollection<IntentTrip>?, Error?) -> Void) {
        let trips = TripsStore()
        let intentTrips = trips.trips.map {
            IntentTrip(identifier: $0.id.uuidString,
                                     display: $0.city,
                                     subtitle: $0.propertyName,
                                     image: INImage(named: $0.image))
        }
        completion(INObjectCollection(items: intentTrips), nil)
    }

    func defaultTrip(for intent: NextTripIntent) -> IntentTrip? {
        let trips = TripsStore()
        let intentTrips = trips.trips.map {
            IntentTrip(identifier: $0.id.uuidString,
                                     display: $0.city,
                                     subtitle: $0.propertyName,
                                     image: INImage(named: $0.image))
        }
        return intentTrips.first
    }

}
