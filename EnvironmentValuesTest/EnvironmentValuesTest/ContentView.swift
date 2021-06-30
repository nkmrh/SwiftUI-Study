//
//  ContentView.swift
//  EnvironmentValuesTest
//
//  Created by hajime-nakamura on 2021/06/17.
//

import SwiftUI

struct VM {
    @Environment(\.int) var int
}

struct ContentView: View {
    @Environment(\.int) var int

    let vm = VM()

    var body: some View {
        Button(action: {
            print(vm.int)
            print(int)
        }, label: {
            Text("Button")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
