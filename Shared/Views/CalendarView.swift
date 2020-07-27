//
//  CalendarView.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import SwiftUI

struct CalendarView: View {

    @State var cellSelected: Int?
    @EnvironmentObject var store: TripsStore
    @Environment(\.deeplink) var deeplink

    var trips: [Trip] { store.trips }

    var body: some View {
        List {
            ForEach((0..<trips.count), id: \.self) { index in
                ZStack {
                    NavigationLink(destination: TripDetailView(trip: trips[index]),
                                   tag: index,
                                   selection: $cellSelected,
                                   label: {
                                    EmptyView()
                                   })
                    CalendarEntryView(trip: trips[index])
                        .onTapGesture {
                            cellSelected = index
                        }
                        .environmentObject(store)
                }
            }
            .listRowBackground(Color.primaryColor)
            .listRowInsets(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        }
        .background(Color.primaryColor.edgesIgnoringSafeArea(.all))
        .onChange(of: deeplink, perform: { deeplink in
            guard let deeplink = deeplink else { return }
            switch deeplink {
            case .details(let reference):
                if let index = trips.firstIndex(where: { $0.reference == reference }) {
                    cellSelected = index
                }
            case .home:
                break
            }
        })
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(TripsStore())
    }
}
