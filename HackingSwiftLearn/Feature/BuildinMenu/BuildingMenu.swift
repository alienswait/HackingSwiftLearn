//
//  BuildingMenu.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 29.07.2024.
//

import SwiftUI

struct BuildingMenu: View {
    
    private let title: String = "Menu"
    private let menuItem: [MenuSection]
    
    init() {
       menuItem = Bundle.main.decodeList(key: .menu, type: MenuSection.self)

    }
    
    var body: some View {
                
        
        NavigationView{
            List{
                ForEach(menuItem){ section in
                    
                    MenuSectionView(menuSection: section)
                    
                }
            }
            .navigationTitle(title)
            .listStyle(.grouped)
            
        }
    }
}

#Preview {
    BuildingMenu()
}



private struct MenuSectionView: View {
    
    let menuSection: MenuSection
    var body: some View {
        Section {
            ForEach(menuSection.items){ item in
                Text(item.name)
            }
        } header: {
            Text(menuSection.name)
        } footer: {
            Text("Count \(menuSection.items.count.description)")
        }
    }
}
