//
//  ContentView.swift
//  IsEnabledTest
//
//  Created by hajime-nakamura on 2021/06/15.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        return Button(action: {}, label: {
            Text("Button")
        })
        .environment(\.isEnabled, false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
