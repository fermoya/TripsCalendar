//
//  NextTripView.swift
//  TripDetailView
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import SwiftUI

struct TripDetailView: View {

    var trip: Trip
    @State var isAlertPresented = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: TripsStore
    @Environment(\.deeplink) var deeplink

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 10) {
                topImage(with: proxy.size.applying(CGAffineTransform(scaleX: 1, y: 0.5)))
                content
                Spacer()
                removeButton
                    .edgesIgnoringSafeArea(.horizontal)
            }
        }
        .navigationBarTitle(trip.city, displayMode: .inline)
        .background(Color.primaryColor.edgesIgnoringSafeArea(.all))
        .onChange(of: deeplink, perform: { deeplink in
            guard let _ = deeplink else { return }
            isAlertPresented = false
        })
    }

    var removeButton: some View {
        HStack {
            Spacer()
            Button(action: {
                isAlertPresented.toggle()
            }, label: {
                Text("Remove")
                    .bold()
                    .padding()
                    .foregroundColor(Color.red)
            })
            .alert(isPresented: $isAlertPresented, content: {
                Alert(title: Text("Are you sure?"),
                      message: Text("If you remove this trip, you'll lose it forever"),
                      primaryButton: .cancel(),
                      secondaryButton: .default(Text("Okay"), action: {
                        store.remove(trip: trip)
                        presentationMode.wrappedValue.dismiss()
                      }))
            })
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.accentColor))
        .padding()
    }

    func topImage(with size: CGSize) -> some View {
        Image(trip.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .clipped()
    }

    var content: some View {
        Group {
            VStack(alignment: .leading) {
                title
                information
                reference
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.accentColor)
                            .padding(8))
        }
        .minimumScaleFactor(0.8)
        .foregroundColor(.primaryColor)
    }

    var title: some View {
        HStack {
            Text(trip.city.uppercased())
                .font(.system(.largeTitle))
                .bold()
            Spacer()
            Text(tripDates)
                .font(.system(.body))
        }
        .padding(.bottom, 8)
    }

    var information: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading) {
                Text("Hotel")
                    .font(.headline)
                Text(trip.propertyName)
                    .font(.subheadline)
                    .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                Text("Address")
                    .font(.headline)
                Text(trip.propertyAddress)
                    .font(.subheadline)
                    .padding(.horizontal)
            }
        }
    }

    var reference: some View {
        HStack {
            Spacer()
            Text(trip.reference)
                .font(.footnote)
                .italic()
        }
    }

    var tripDates: String {
        "\(trip.arrivalDate.day) \(trip.arrivalDate.month) - \(trip.departureDate.day) \(trip.departureDate.month)"
    }

}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailView(trip: nextTrips[0])
    }
}
