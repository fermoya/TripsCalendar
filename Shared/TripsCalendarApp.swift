//
//  TripsCalendarApp.swift
//  Shared
//
//  Created by Fernando Moya de Rivas on 25/07/2020.
//

import SwiftUI

@main
struct TripsCalendarApp: App {

    @StateObject var tripsStore = TripsStore()
    @State var deeplink: Deeplinker.Deeplink?

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tripsStore)
                .environment(\.deeplink, deeplink)
                .onOpenURL { url in
                    let deeplinker = Deeplinker()
                    guard let deeplink = deeplinker.manage(url: url) else { return }
                    self.deeplink = deeplink
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
                        self.deeplink = nil
                    }
                }
        }
    }
}
