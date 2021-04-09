# SwiftUI View の id() メソッドを理解する

元ネタ：https://swiftui-lab.com/swiftui-id/

SwiftUI.View.id(_) を理解したい

定義

```swift
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Binds a view's identity to the given proxy value.
    ///
    /// When the proxy value specified by the `id` parameter changes, the
    /// identity of the view — for example, its state — is reset.
    @inlinable public func id<ID>(_ id: ID) -> some View where ID : Hashable

}
```

Hashable を引数にとり View を返すメソッド。

コメント日本語訳
/// View のアイデンティティを、与えられたプロキシ値にバインドします。

/// id` パラメータで指定されたプロキシ値が変更されると、View の

/// アイデンティティ（例えば、その状態）がリセットされます。

なるほど？😮

どうゆうことなのか試してみる

Demo
https://github.com/nkmrh/SwiftUI-Study/tree/main/swiftui-id/ResettingStateValues

id の値を変更すると確かにリセットされているように見える。

でも実際には状態がリセットされているわけではなく、新しい View が生成されている。

Demo
https://github.com/nkmrh/SwiftUI-Study/tree/main/swiftui-id/TriggeringTransitions

他にもListのパフォーマンスを改善させたい場合に使える

Demo
https://github.com/nkmrh/SwiftUI-Study/tree/main/swiftui-id/ImprovingTheListViewPerformance

TableView.reloadData() のような使い方ができる。

ForEach, List は指定した id の数だけ View を生成する。Id が重複した場合、再利用される。

Demo
https://github.com/nkmrh/SwiftUI-Study/tree/main/swiftui-id/SameIDSameInstance

React の key に似ている
