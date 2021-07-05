//
//  ContentView.swift
//  DemystifiedNavigationLink2
//
//  Created by hajime-nakamura on 2021/06/30.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var isActive = false
}

//class Item: Identifiable {
//    var id = UUID()
//    var name: String
//    var isActive = false
//
//    init(name: String) {
//        self.name = name
//    }
//}

struct ContentView: View {
    // Item が struct の場合は pop できる
    // class だと isActive を更新してもオブジェクトは変わらないので
    // body が呼ばれない
    @State var items: [Item] = [
        Item(name: "Hanbarger"),
        Item(name: "Potato"),
        Item(name: "Juice"),
    ]

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List {
            ForEach(items.indices, id: \.self) { index in
                NavigationLink(
                    destination:
                        ContentView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(
                            leading:
                                Button(action: {
                                    items[index].isActive = false
                                }) {
                                    Image(systemName: "circle")
                                }
                        )
                    ,
                    isActive: $items[index].isActive,
                    label: {
                        Button(action: {
                            items[index].isActive = true
                        }, label: {
                            Text("\(items[index].name)")
                        })
                    }
                )
            }
        }
    }

    // iOS 15
//    var body: some View {
//        List($items) { $item in
//            NavigationLink(
//                destination:
//                    ContentView()
//                    .navigationBarBackButtonHidden(true)
//                    .navigationBarItems(
//                        leading:
//                            Button(action: {
//                                item.isActive = false
//                            }) {
//                                Image(systemName: "circle")
//                            }
//                    )
//                ,
//                isActive: $item.isActive,
//                label: {
//                    Button(action: {
//                        item.isActive = true
//                    }, label: {
//                        Text("\(item.name)")
//                    })
//                }
//            )
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
