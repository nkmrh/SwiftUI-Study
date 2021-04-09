//
//  ContentView.swift
//  SameIDSameInstance
//
//  Created by hajime-nakamura on 2021/04/09.
//

import SwiftUI

extension String {
    static func random(length: Int = 20) -> String {
        String((0..<length).map { _ in "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".randomElement()! })
    }
}

class Item: Identifiable {
    var id = 0
    var name = String.random()

    init(id: Int = 0) {
        self.id = id
    }
}

struct CustomView: View {
    var item: Item

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
            Text("address:") + Text(String(describing: Unmanaged.passRetained(item).toOpaque()))
        }
    }

    init(item: Item) {
        self.item = item
        print("I'm only called once. \(item.id)")
    }
}

struct ContentView: View {
    @State private var array = (0..<50).map { _ in Item() }
//    @State private var array = (0..<50).map { Item(id: $0) }

    var body: some View {
        List(array) { item in
            CustomView(item: item)
        }
        .onAppear {
            print(array.count)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
