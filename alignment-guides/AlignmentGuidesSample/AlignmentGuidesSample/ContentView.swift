//
//  ContentView.swift
//  AlignmentGuidesSample
//
//  Created by hajime-nakamura on 2021/05/28.
//

import SwiftUI

// Alignment Guide を利用するとコンテナビュー内の子ビューに対して相対的なレイアウトを指定できる

struct HelloWorld: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

// コンテナ内の全てのビューは、アライメントガイドを持つ。明示的に指定されていない場合は、コンテナのアラインメントパラメータによって決定されます。

struct VerticalBasicView: View {
    var body: some View {
        // Container Alignment
        // .leading: subview に対するアラインメント
        // これには2つの目的があります。
        // 1. どのalignmentGuides()が無視され、どのalignmentGuides()が無視されないかを指定します
        // 2. コンテナに含まれるビューのうち、明示的なガイドを持たないものに対しては、暗黙のアライメントガイドを定義します
//        VStack(alignment: .leading) {
//            HelloWorld().background(Color.red)
//                // Alignment Guide
//                // .leading: 子ビューのオフセットの基準となるアラインメント
//                // この値がContainer Alignmentパラメータと一致しない限り、このガイドはレイアウト時に無視されます。
//
//                // computeValue: オフセット値 CGFloat を返すクロージャ
//                // dimention: View のサイズ, Viewのコーディネートスペースに基づいたアラインメント
//                .alignmentGuide(.leading, computeValue: { dimension in
//                    // Implicit Alignment Value
//                    // これは数値で、変更するビューのガイドの位置を示します。d.width, d[.leading], d[.center] などの便利なプリセット値もありますが、最終的には数値を返します。これは、与えられたガイドに関連付けられたデフォルト（暗黙）の値です。
////                    dimension[HorizontalAlignment.center]
////                    dimension[.leading]
//                    100
//                })
//            HelloWorld().background(Color.blue)
//                .alignmentGuide(.leading, computeValue: { dimension in
//                    // Explicit Alignment Value
//                    // これは数値で、変更するビューのガイドの位置を示します。これは、明示的な値（プログラムで定義された値）です。
////                    (dimension[explicit: .leading] ?? 100)
//                    0
//                })
//
//            HelloWorld().background(Color.green)
//                .alignmentGuide(.leading, computeValue: { dimension in
//                    0
//                })
//        }
        VStack {
            Rectangle()
                .fill()
                .foregroundColor(.red)
                .frame(width: 100, height: 100, alignment: .trailing)
        }
        .frame(width: 300, height: 300)
        .foregroundColor(.blue)

    }
}

// コンテナ内のすべてのビューは、アライメントを持っています。


//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//public struct ViewDimensions {
//
//    /// The view's width.
//    public var width: CGFloat { get }
//
//    /// The view's height.
//    public var height: CGFloat { get }
//
//    /// Gets the value of the given horizontal guide.
//    public subscript(guide: HorizontalAlignment) -> CGFloat { get }
//
//    /// Gets the value of the given vertical guide.
//    public subscript(guide: VerticalAlignment) -> CGFloat { get }
//
//    /// Gets the explicit value of the given alignment guide in this view, or
//    /// `nil` if no such value exists.
//    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? { get }
//
//    /// Gets the explicit value of the given alignment guide in this view, or
//    /// `nil` if no such value exists.
//    public subscript(explicit guide: VerticalAlignment) -> CGFloat? { get }
//}

struct HorizontalBasic: View {
    var body: some View {
        HStack(alignment: .top) {
            HelloWorld().background(Color.red)
                .alignmentGuide(.top, computeValue: { dimension in
                    dimension[VerticalAlignment.center]
                })
            HelloWorld().background(Color.blue)
                .alignmentGuide(.leading, computeValue: { dimension in
                    0
                })
            HelloWorld().background(Color.green)
                .alignmentGuide(.leading, computeValue: { dimension in
                    0
                })
        }
    }
}

struct VerticalIndentationView: View {
    @State var selectedIndex = 0
    private let indent: CGFloat = 50

    var body: some View {
        VStack(alignment: .trailing) {
            HelloWorld().background(Color.red)
                .alignmentGuide(.trailing, computeValue: { d in d.width - indent * (selectedIndex == 0 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 0
                    }
                }
            HelloWorld().background(Color.blue)
                .alignmentGuide(.trailing, computeValue: { d in d.width - indent * (selectedIndex == 1 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 1
                    }
                }
            HelloWorld().background(Color.green)
                .alignmentGuide(.trailing, computeValue: { d in d.width - indent * (selectedIndex == 2 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 2
                    }
                }
        }
    }
}

struct HorizontalIndentationView: View {
    @State var selectedIndex = 0
    private let indent: CGFloat = 50

    var body: some View {
        HStack(alignment: .top) {
            HelloWorld().background(Color.red)
                .alignmentGuide(.top, computeValue: { d in -indent * (selectedIndex == 0 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 0
                    }
                }
            HelloWorld().background(Color.blue)
                .alignmentGuide(.top, computeValue: { d in -indent * (selectedIndex == 1 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 1
                    }
                }
            HelloWorld().background(Color.green)
                .alignmentGuide(.top, computeValue: { d in -indent * (selectedIndex == 2 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 2
                    }
                }
        }
    }
}

struct FrameView: View {
    @State var selectedIndex = 0
    private let indent: CGFloat = 50

    var body: some View {
        HStack(alignment: .top, spacing: .zero) {
            HelloWorld().background(Color.red)
                .alignmentGuide(.top, computeValue: { d in -indent * (selectedIndex == 0 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 0
                    }
                }
                .frame(width: 50)
            HelloWorld().background(Color.blue)
                .alignmentGuide(.top, computeValue: { d in -indent * (selectedIndex == 1 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 1
                    }
                }
                .frame(width: 50)
            HelloWorld().background(Color.green)
                .alignmentGuide(.top, computeValue: { d in -indent * (selectedIndex == 2 ? 1 : 0) })
                .onTapGesture {
                    withAnimation {
                        selectedIndex = 2
                    }
                }
                .frame(width: 50)
        }
        .frame(width: 300, alignment: .center)
    }
}

struct AnimateAlignment: View {
    @State private var alignment: HorizontalAlignment = .leading

    var body: some View {
        VStack {
            Spacer()

             VStack(alignment: alignment) {
                HelloWorld().background(Color.red)
                .alignmentGuide(.leading, computeValue: { _ in 30 } )
                   .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } )
                   .alignmentGuide(.trailing, computeValue: { _ in 90 } )

                HelloWorld().background(Color.blue)
                   .alignmentGuide(.leading, computeValue: { _ in 90 } )
                   .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } )
                   .alignmentGuide(.trailing, computeValue: { _ in 30 } )

                HelloWorld().background(Color.green) // use implicit guide

             }

            Spacer()
            HStack {
                Button("leading") { withAnimation(.easeInOut(duration: 1)) { alignment = .leading }}
                Button("center") { withAnimation(.easeInOut(duration: 1)) { alignment = .center }}
                Button("trailing") { withAnimation(.easeInOut(duration: 1)) { alignment = .trailing }}
            }
        }
    }
}

extension HorizontalAlignment {
    private enum CustomAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return 0//d[HorizontalAlignment.center]
        }
    }
    static let custom = HorizontalAlignment(CustomAlignment.self)
}

struct Custom: View {
    @State var alignment: HorizontalAlignment = .leading

    var body: some View {
        VStack(alignment: .custom) {
            Image(systemName: "arrow.down.circle.fill")
                .alignmentGuide(.custom, computeValue: { d in
//                    d[HorizontalAlignment.center]
                    0
                })
            HStack(alignment: .top) {
                ForEach(0..<3) { index in
                    HelloWorld().background(Color.red)
                        .onTapGesture {
                            withAnimation {
                                switch index {
                                case 0:
                                    alignment = .leading
                                case 1:
                                    alignment = .center
                                case 2:
                                    alignment = .trailing
                                default:
                                    alignment = .leading
                                }
                            }
                        }
                }
            }
            .frame(width: 10)
            .padding(0)
            .alignmentGuide(.custom, computeValue: { d in
                d[alignment]
//                    0
            })
        }
    }
}

struct ContentView: View {
    var body: some View {
//        VerticalBasicView()
//        VerticalIndentationView()
//        HorizontalBasic()
//        HorizontalIndentationView()
//        FrameView()
        Custom()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalBasicView()
            .previewDisplayName("VerticalBasicView")
        VerticalIndentationView()
            .previewDisplayName("VerticalIndentationView")
        HorizontalBasic()
            .previewDisplayName("HorizontalBasic")
        HorizontalIndentationView()
            .previewDisplayName("HorizontalIndentationView")
        AnimateAlignment()
            .previewDisplayName("AnimateAlignment")
        Custom()
            .previewDisplayName("Custom")
    }
}

// まとめ

// コンテナ内の全てのビューは、アライメントガイドを持つ。明示的に指定されていない場合は、コンテナのアラインメントパラメータによって決定されます。
//レイアウト中、コンテナのalignmentパラメータで指定されたものと異なるタイプのアラインメントガイドは無視されます。
//VStackではHorizontalAlignment、HStackではVerticalAlignmentが使用されます。
//コンテナがタイトな場合、frameメソッドのalignmentパラメータは視覚的な効果を持ちません。
//カスタムアライメントガイドは、ビュー階層の異なるブランチの2つのビューを互いに整列させる必要がある場合に必要です。
