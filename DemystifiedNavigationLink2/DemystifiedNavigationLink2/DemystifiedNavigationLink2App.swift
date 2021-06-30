//
//  DemystifiedNavigationLink2App.swift
//  DemystifiedNavigationLink2
//
//  Created by hajime-nakamura on 2021/06/30.
//

import SwiftUI

@main
struct DemystifiedNavigationLink2App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
