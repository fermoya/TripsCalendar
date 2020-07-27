//
//  TripsCalendarWidget.swift
//  TripsCalendarWidget
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import SwiftUI
import WidgetKit

@main
struct TripsCalendarWidget: WidgetBundle {

    @WidgetBundleBuilder
    var body: some Widget {
        NextTripWidget()
        CalendarWidget()
    }

}
