//
//  ContentView.swift
//  ResettingStateValues
//
//  Created by hajime-nakamura on 2021/04/08.
//

import SwiftUI

struct ContentView: View {
    @State private var theId = 0

    var body: some View {
        VStack {
            ExampleView().id(theId)

            Button("Reset") { self.theId += 1 }
        }
    }
}

struct ExampleView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var website = ""

    var body: some View {
        Form {
            TextField("Enter firstname", text: self.$firstname)
            TextField("Enter lastname", text: self.$lastname)
            TextField("Enter email address", text: self.$email)
            TextField("Enter website address", text: self.$website)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
