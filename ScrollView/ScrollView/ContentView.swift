//
//  ContentView.swift
//  ScrollView
//
//  Created by hajime-nakamura on 2021/06/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<100) { _ in
                Text("Hello, world!")
                    .padding()
            }
        }
        .content
        .offse

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
