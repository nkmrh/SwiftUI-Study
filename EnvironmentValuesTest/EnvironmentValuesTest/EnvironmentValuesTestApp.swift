//
//  EnvironmentValuesTestApp.swift
//  EnvironmentValuesTest
//
//  Created by hajime-nakamura on 2021/06/17.
//

import SwiftUI

private struct IntEnvironmentKey: EnvironmentKey {
    static let defaultValue: Int = 0
}

extension EnvironmentValues {
    var int: Int {
        get { self[IntEnvironmentKey.self] }
        set { self[IntEnvironmentKey.self] = newValue }
    }
}

@main
struct EnvironmentValuesTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.int, 1)
        }
    }
}
