//
//  ContentView.swift
//  TriggeringTransitions
//
//  Created by hajime-nakamura on 2021/04/08.
//

import SwiftUI

struct ContentView: View {
    @State private var theId = 0

    var body: some View {
        VStack(spacing: 20) {
            MyCircle()
                .transition(AnyTransition.opacity.combined(with: .slide))
                .id(theId)

            Text("id = \(theId)    ")

            Button("Increment Id") {
                withAnimation(.easeIn(duration: 2.0)) {
                    self.theId += 1
                }
            }
        }
    }

    struct MyCircle: View {
        private let color: Color = [.red, .green, .blue, .purple, .orange, .pink, .yellow].randomElement()!

        var body: some View {
            return Circle()
                .foregroundColor(color)
                .frame(width: 180, height: 180)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
