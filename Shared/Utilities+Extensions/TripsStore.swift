//
//  TripsRepository.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 26/07/2020.
//

import Foundation
import WidgetKit

class TripsStore: ObservableObject {

    private var fileName = "trips.json"
    private var groupName = "group.trips.calendar"

    @Published var trips: [Trip] = [] {
        didSet {
            save()
        }
    }

    private var isLoaded = false

    init() {
        load()
        isLoaded = true
    }

    private func load() {
        guard let folderUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupName) else { return }

        let fileUrl = folderUrl.appendingPathComponent(fileName)

        var trips: [Trip] = []
        if let data = try? Data(contentsOf: fileUrl), let decodedTrips = try? JSONDecoder().decode([Trip].self, from: data) {
            trips = decodedTrips
        }

        self.trips = trips.isEmpty ? nextTrips : trips
    }

    func save(newTrip: Trip) {
        guard !trips.contains(newTrip) else { return }
        trips = (trips + [newTrip]).sorted()
    }

    func remove(trip: Trip) {
        guard let index = trips.firstIndex(of: trip) else { return }
        trips.remove(at: index)
    }

    private func save() {
        guard let folderUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupName) else { return }
        let fileUrl = folderUrl.appendingPathComponent(fileName)
        guard let data = try? JSONEncoder().encode(trips) else { return }
        try? data.write(to: fileUrl)

        guard isLoaded else { return }
        WidgetCenter.shared.reloadAllTimelines()
    }

}
