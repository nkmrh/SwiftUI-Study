//
//  ContentView.swift
//  InfiniteLoopBodyExample
//
//  Created by hajime-nakamura on 2021/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CountExample()
//        WidthExample()
    }
}

struct CountExample: View {
    @State private var count = 0

    var body: some View {
        DispatchQueue.main.async {
            self.count += 1
        }
        return Text("\(count)")
    }
}

struct WidthExample: View {
    @State private var width: CGFloat = 0.0

    var  body: some View {
        print(width)
        return Text("\(width)")
            .font(.largeTitle)
//            .font(.custom("Menlo", size: 32)) // mono-spaced
            .background(
                GeometryReader { proxy -> AnyView in
//                    DispatchQueue.main.async {
                        self.width = proxy.frame(in: .local).width
//                    }
                    return AnyView(Color.clear)
                }
            )
    }
    /// 数字のフォント幅が一定でないため無限ループが起こる (0と5の幅が0.5違う)
    /// print(width)
    /// 0.0
    /// 136.5 <- 0.0 表示時の幅
    /// 169.0 <- 136.5 表示時の幅
    /// 169.5 <- 169.0 表示時の幅
    /// 169.0 <- 169.5 表示時の幅
    /// 169.5 <- 169.0 表示時の幅
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
