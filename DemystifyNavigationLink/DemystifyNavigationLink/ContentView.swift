//
//  ContentView.swift
//  DemystifyNavigationLink
//
//  Created by hajime-nakamura on 2021/06/11.
//

import SwiftUI

struct CustomView: View {
    @Binding var item: Item

    var body: some View {
        Button(action: {
            item.isActive.toggle()
        }, label: {
            Text("Button \(item.item) \(String(item.isActive))")
        })
    }
}

//struct CustomView: View {
//    var item: Item
//
//    var body: some View {
//        Button(action: {
//            item.isActive.toggle()
//        }, label: {
//            Text("Button \(item.item)")
//        })
//    }
//}

class Item {
    var id: Int {
        item
    }
    let item: Int
    var isActive = false

    init(item: Int) {
        self.item = item
    }
}

//struct Item {
//    var id: Int {
//        item
//    }
//    let item: Int
//    var isActive = false
//}

class ViewModel: ObservableObject {
    @Published var isActive = false

    @Published var array: [Item] = [
        Item(item: 0),
        Item(item: 1),
        Item(item: 2),
        Item(item: 3),
        Item(item: 4),
    ]
}

struct ContentView: View {
//    @StateObject var vm = ViewModel()
    @State var array: [Item] = [
        Item(item: 0),
        Item(item: 1),
        Item(item: 2),
        Item(item: 3),
        Item(item: 4),
    ]

    var body: some View {
//        NavigationView {
//            ZStack {
//                nv()
//                Button(action: {
//                    vm.isActive = true
//                }, label: {
//                    Text("Button!!!!")
//                })
//            }
//        }

//        print(String(describing: Unmanaged.passRetained(vm.array[0]).toOpaque()))
//        print(vm.array[0].isActive)
//        return NavigationView {
//            List(0..<vm.array.count) { i in
//                NavigationLink(
//                    destination: CustomView(item: vm.array[i], isActive: $vm.array[i].isActive),
//                    isActive: $vm.array[i].isActive,
//                    label: {
//                        Text("Navigate \(vm.array[i].item)")
//                    }
//                )
//            }
//        }

//        print(String(describing: Unmanaged.passRetained(array[0]).toOpaque()))
//        print(array[0].isActive)
//        return NavigationView {
//            List(0..<array.count) { i in
//                NavigationLink(
//                    destination: CustomView(item: $array[i]),
//                    isActive: $array[i].isActive,
//                    label: {
//                        Text("Navigate \(array[i].item)")
//                    }
//                )
//            }
//        }

        print(array[0].isActive)
        return NavigationView {
            List(0..<array.count) { i in
                NavigationLink(
                    destination: CustomView(item: $array[i]),
                    isActive: $array[i].isActive,
                    label: {
                        Text("Navigate \(array[i].item)")
                    }
                )
            }
        }
    }

//    func nv() -> some View {
//        NavigationLink(
//            destination: CustomView(item: Item(item: 0), isActive: $vm.isActive),
//            isActive: $vm.isActive,
//            label: {
//                EmptyView()
//            }
//        )
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
