//
//  NewTripView.swift
//  TripsCalendar
//
//  Created by Fernando Moya de Rivas on 26/07/2020.
//

import SwiftUI

struct NewTripView: View {

    @EnvironmentObject var store: TripsStore
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.deeplink) var deeplink

    @State var city = ""
    @State var propertyName = ""
    @State var propertyAddress = ""
    @State var arrivalDate: Date = .now
    @State var departureDate: Date = Date.now.addingTimeInterval(24 * 3600 * 2)

    var body: some View {
        Form {
            List {
                Section(header: Text("Destination").foregroundColor(.accentColor).bold()) {
                    TextField("City", text: $city)
                    TextField("Hotel", text: $propertyName)
                    TextField("Address", text: $propertyAddress)
                }

                Section(header: Text("Duration").foregroundColor(.accentColor).bold()) {
                    DatePicker("Arrival",
                               selection: $arrivalDate,
                               in: PartialRangeFrom(arrivalDate))
                    DatePicker("Departure",
                               selection: $departureDate,
                               in: PartialRangeFrom(arrivalDate))
                }
            }
        }
        .navigationBarItems(leading: leftNavbarButton,
                            trailing: rightNavbarButton)
        .background(Color.primaryColor.edgesIgnoringSafeArea(.all))
        .onChange(of: deeplink, perform: { deeplink in
            guard let _ = deeplink else { return }
            presentationMode.wrappedValue.dismiss()
        })
    }

    var leftNavbarButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }

    var rightNavbarButton: some View {
        Button("Save") {
            let trip = Trip(reference: "XXXXXX", propertyName: propertyName, propertyAddress: propertyAddress, image: city.lowercased().replacingOccurrences(of: " ", with: "-"), city: city, arrivalDate: arrivalDate, departureDate: departureDate)
            store.save(newTrip: trip)
            presentationMode.wrappedValue.dismiss()
        }
    }

}


struct NewTripView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripView()
            .environmentObject(TripsStore())
    }
}
