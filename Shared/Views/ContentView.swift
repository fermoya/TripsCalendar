//
//  ContentView.swift
//  Shared
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import SwiftUI

struct ContentView: View {

    @State var isNewTripPresented = false
    @EnvironmentObject var tripsStore: TripsStore
    @Environment(\.deeplink) var deeplink

    var body: some View {
        NavigationView {
            CalendarView()
                .navigationTitle("Calendar")
                .navigationBarItems(trailing: rightNavbarButton)
        }
        .onAppear {
            UITableViewCell.appearance().selectionStyle = .none
            UITableView.appearance().backgroundColor = UIColor.clear
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().backgroundColor = UIColor(named: "PrimaryColor")?.withAlphaComponent(0.5)
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().barTintColor = UIColor(named: "AccentColor")
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "AccentColor")!]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "AccentColor")!]
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $isNewTripPresented) {
            NavigationView {
                NewTripView()
                    .environmentObject(tripsStore)
                    .environment(\.deeplink, deeplink)
                    .navigationBarTitle("New Trip", displayMode: .inline)
            }
        }
    }

    var rightNavbarButton: some View {
        Button {
            isNewTripPresented.toggle()
        } label: {
            Image(systemName: "plus")
                .padding()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TripsStore())
    }
}
