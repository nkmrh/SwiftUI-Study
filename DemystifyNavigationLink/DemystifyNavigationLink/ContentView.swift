//
//  ContentView.swift
//  DemystifyNavigationLink
//
//  Created by hajime-nakamura on 2021/06/11.
//

import SwiftUI

struct CustomView: View {
    let item: Item
    @Binding var isActive: Bool

    var body: some View {
        Button(action: {
            isActive.toggle()
        }, label: {
            Text("Button \(item.item)")
        })
    }
}

struct Item {
    var id: Int {
        item
    }
    let item: Int
    var isActive = false
}

struct ContentView: View {
    @State var array: [Item] = [
        Item(item: 0),
        Item(item: 1),
        Item(item: 2),
        Item(item: 3),
        Item(item: 4),
    ]
//    @State var isActive = false

    var body: some View {
        NavigationView {
            List(0..<array.count) { i in
                NavigationLink(
                    destination: CustomView(item: array[i], isActive: $array[i].isActive),
                    isActive: $array[i].isActive,
                    label: {
                        Text("Navigate \(array[i].item)")
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
