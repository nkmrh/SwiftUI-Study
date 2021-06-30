//
//  ContentView.swift
//  DismissTest
//
//  Created by hajime-nakamura on 2021/06/18.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            dismiss()
//            presentationMode.wrappedValue.dismiss()
        } ) {
            Text("Dismiss")
        }
    }
}

@available(iOS 15.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Push view", destination: DetailView())
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
