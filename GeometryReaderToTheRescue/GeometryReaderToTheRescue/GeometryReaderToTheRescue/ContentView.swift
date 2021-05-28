//
//  ContentView.swift
//  GeometryReaderToTheRescue
//
//  Created by hajime-nakamura on 2021/05/21.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            Text("Hello There!")
            MyRectangle()
        }
        .frame(width: 150, height: 100)
        .border(Color.black)
    }
}

//struct MyRectangle: View {
//    var body: some View {
//        Rectangle().fill(Color.blue)
//    }
//}

struct MyRectangle: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .path(
                    in:
                        CGRect(
                            x: geometry.size.width + 5,
                            y: 0,
                            width: geometry.size.width / 2.0,
                            height: geometry.size.height / 2.0
                        )
                )
                .fill(Color.blue)
        }
    }
}

/*
GeometryProxy

 public var size: CGSize { get }
 親View指定のサイズ
 public var safeAreaInsets: EdgeInsets { get }
 public func frame(in coordinateSpace: CoordinateSpace) -> CGRect
 .local, .global, .named() を指定して親指定のフレームを返す
 public subscript<T>(anchor: Anchor<T>) -> T where T : Equatable { get }
 subviewのサイズとポジションを取得する
 */

/*
combinationg with the .background() or .overlay() modifier, it can be more powerful.

 */



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
