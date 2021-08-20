//
//  HeroView.swift
//  Matchedgeometryeffect-part1
//
//  Created by hajime-nakamura on 2021/08/13.
//

import SwiftUI

struct HeroView: View {
    @Namespace var nameSpace
    @State private var selectedIndex: Int?

    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<20) { index in
                        HStack {
                            Image("urutoraman")
                                .resizable()
                                .scaledToFill()
                                .matchedGeometryEffect(id: "hero-\(index)", in: nameSpace)
                                .frame(width: 100, height: 80)
                                .clipped()
                                .cornerRadius(5)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedIndex = index
                                    }
                                }
                            Text("ウルトラマン \(index)")
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            if selectedIndex != nil {
                Color.black.opacity(0.5)
                    .frame(width: .infinity, height: .infinity)
                VStack {
                    Image("urutoraman")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "hero-\(selectedIndex!)", in: nameSpace)
                        .frame(width: 360, height: 200)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedIndex = nil
                            }
                        }
                        .zIndex(.infinity)
                    Color.white
                }
            }
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
