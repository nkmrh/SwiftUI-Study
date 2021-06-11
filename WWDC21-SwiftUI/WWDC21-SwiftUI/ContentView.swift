//
//  ContentView.swift
//  WWDC21-SwiftUI
//
//  Created by hajime-nakamura on 2021/06/11.
//

import SwiftUI

struct Response: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Item]
}

struct Item: Decodable, Identifiable, Equatable {
    var id: String { name }
    let name: String
}

struct ContentView: View {
    @State private var items: [Item] = []
    @State private var searchText = ""
    @State private var showImage = true

    private var searchResults: [Item] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.contains(searchText) }
        }
    }

    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(items) { item in
                        ItemRow(item: item, imageHidden: !showImage)
                        // MARK: - listRowSeparator hidden
                        .listRowSeparator(.hidden)
                        // MARK: - swipeActions
                        .swipeActions(allowsFullSwipe: false) {
                            Button(action: {
                                withAnimation {
                                    if let index = items.firstIndex(of: item) {
                                        items.remove(at: index)
                                    }
                                }
                            }) {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            // MARK: - tint
                            .tint(.red)
                        }
                    }
                }
                // MARK: - refreshable
                .refreshable {
                    let url = URL(string: "https://swapi.dev/api/people")!
                    // MARK: - async
                    let (data, _) = try! await URLSession.shared.data(from: url)
                    let response = try! JSONDecoder().decode(Response.self, from: data)
                    withAnimation {
                        items = response.results
                    }
                }
                // MARK: - searchable
                .searchable(text: $searchText) {
                    ForEach(searchResults) { result in
                        ItemRow(item: result, imageHidden: !showImage)
                    }
                }
                // MARK: - short hand
                .navigationViewStyle(.automatic)
                .navigationTitle(Text("Title"))
                .navigationBarItems(
                    trailing: Toggle(isOn: $showImage) {
                        Label("Show image", systemImage: "photo")
                    }
                    // MARK: - toggle style button
                    .toggleStyle(.button)
                )
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            // MARK: - badge
            .badge(items.count)
        }
    }
}

struct ItemRow: View {
    let item: Item
    let imageHidden: Bool

    var body: some View {
        HStack {
            if !imageHidden {
                // MARK: - async image
                AsyncImage(
                    url: URL(string: "https://picsum.photos/50")!,
                    content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(5)
                },
                    placeholder: {
                    Color.gray
                        .frame(width: 50, height: 50)
                        .cornerRadius(5)
                        .overlay(ProgressView())
                    }
                )
            }
            // MARK: - markdown
            Text("**\(item.name)**")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
