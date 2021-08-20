//
//  ContentView.swift
//  SheetAndOnDisappearTest
//
//  Created by hajime-nakamura on 2021/07/13.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var name = "ディテイル"
}

struct DetaiView: View {
    @StateObject var vm = ViewModel()
    @Binding var isPresented: Bool

    var body: some View {
        Text("私は\(vm.name)です")
            .padding()
        Button(action: {
            isPresented = false
        }, label: {
            Text("Close")
        })
        .onDisappear {
            vm.name = ""
        }
    }
}

struct ContentView: View {
    @State var isPresented = false
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button(action: {
            isPresented = true
        }, label: {
            Text("Open")
        })
        .background(
            EmptyView()
                .fullScreenCover(isPresented: $isPresented, content: {
                    DetaiView(isPresented: $isPresented)
                })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
