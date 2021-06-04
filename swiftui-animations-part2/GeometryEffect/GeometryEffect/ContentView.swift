//
//  ContentView.swift
//  GeometryEffect
//
//  Created by hajime-nakamura on 2021/06/04.
//

import SwiftUI

struct ContentView: View {
    @State var offsetX: Double = 0
    @State var offsetY: Double = 0
    @State var scaleX: Double = 1
    @State var scaleY: Double = 1
    @State var angle: CGFloat = 0

    var body: some View {
        VStack {
            Text("Hello, world!")
                .background(
                    GeometryReader { proxy -> Color in
                        print(proxy.frame(in: .global))
                        return Color.red
                    }
                )
                
                .padding()
                .modifier(
                    AffineTransform(
                        offset: .init(x: offsetX, y: offsetY),
                        scale: .init(x: scaleX, y: scaleY),
                        angle: angle
                    )
                    .ignoredByLayout()
                )
                .onTapGesture {
                    print("!!!!!!!!!!!!!!!!!!")
                }
                .onAppear {
                    withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                        angle = CGFloat(deg2rad(360))
                    }
                    //                    print(proxy.frame(in: .local))
                }


            Slider(value: $offsetX, in: -200...200)
            Slider(value: $offsetY, in: -200...200)
            Slider(value: $scaleX, in: 0...10)
            Slider(value: $scaleY, in: 0...10)
            Slider(value: $angle, in: 0...CGFloat(deg2rad(360)))
        }
    }
}

func deg2rad(_ number: Double) -> Double {
    return number * .pi / 180
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AffineTransform: GeometryEffect {
    let offset: CGPoint
    let scale: CGPoint
    var angle: CGFloat

    var animatableData: CGFloat {
        get { angle }
        set {
            angle = newValue
        }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: offset.x, y: offset.y)
                .concatenating(
                    CGAffineTransform(scaleX: scale.x, y: scale.y)
                        .concatenating(
                            CGAffineTransform(rotationAngle: angle)
                        )
                )
        )
    }
}
