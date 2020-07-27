//
//  URL+App.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import Foundation

extension URL {
    static let appScheme = "tcal"
    static let appHost = "www.trips.calendar.com"
    static let appHomeUrl = "\(Self.appScheme)://\(Self.appHost)"
    static let appDetailsPath = "details"
    static let appReferenceQueryName = "reference"
    static let appDetailsUrlFormat = "\(Self.appHomeUrl)/\(Self.appDetailsPath)?\(Self.appReferenceQueryName)=%@"
}
