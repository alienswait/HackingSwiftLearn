//
//  CompainsListRowView.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 29.07.2024.
//

import SwiftUI

struct CompainsListRow: View {
    private let menuItem: [MenuSection]
    
    init() {
        menuItem = Bundle.main.decodeList(key: .menu, type: MenuSection.self)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItem) { section in
                    Section {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    } header: {
                        Text(section.name)
                    }

                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("\(item.price)$")
            }
        }
    }
}

struct CompainsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        CompainsListRow()
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CompainsListRow()
    }
}
