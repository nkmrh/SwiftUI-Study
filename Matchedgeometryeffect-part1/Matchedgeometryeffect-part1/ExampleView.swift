//
//  ExampleView.swift
//  Matchedgeometryeffect-part1
//
//  Created by hajime-nakamura on 2021/08/13.
//

import SwiftUI

struct ExampleView: View {
    @Namespace var nspace
    @State private var flag: Bool = true

    var body: some View {
        HStack {
            if flag {
                Polygon(color: .red)
                    .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                    .frame(width: 100, height: 100)
            }

            Spacer()

            Button("Switch") {
                withAnimation(.easeInOut(duration: 1.0)) {
                    flag.toggle()
                }
            }

            Spacer()

            VStack {
                Rectangle().fill(Color.yellow).frame(width: 50, height: 50)

                if !flag {
                    Polygon(color: .red)
//                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                        .frame(width: 50, height: 50)
                }

                Rectangle().fill(Color.yellow).frame(width: 50, height: 50)
            }

        }.frame(width: 400)
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
