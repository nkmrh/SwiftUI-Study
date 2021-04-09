//
//  ContentView.swift
//  ImprovingTheListViewPerformance
//
//  Created by hajime-nakamura on 2021/04/08.
//

import SwiftUI

extension String {
    static func random(length: Int = 20) -> String {
        String((0..<length).map { _ in "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".randomElement()! })
    }
}

struct ContentView: View {
    @State private var array = (0..<5000).map { _ in String.random() }

    var body: some View {
        VStack {
            List(array, id: \.self) { item in
                Text("\(item)")
            }

            Button("Shuffle") {
                self.array.shuffle()
            }
        }
    }
}

struct ContentView1: View {
    @State private var theId = 0
    @State private var array = (0..<5000).map { _ in String.random() }

    var body: some View {
        VStack {
            List(array, id: \.self) { item in
                Text("\(item)")
            }.id(theId)


            Button("Shuffle") {
                self.array.shuffle()
                self.theId += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView1()
    }
}
