//
//  MainTabView.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 31.07.2024.
//

import SwiftUI

private struct MainTabViewItems: Identifiable {
    let title: String
    let images: SystemImages
    let view: AnyView
    let id = UUID()
    
    
    init(title: String, images: SystemImages, view: any View) {
        self.title = title
        self.images = images
        self.view = AnyView(view)
    }
    
    
    static let items: Array<MainTabViewItems> = [
        
        MainTabViewItems(title: "Menu", images: .home, view: DisplayDetailScreenWithNavigation()),
        MainTabViewItems(title: "Order", images: .order, view: OrderViewEnvironment())
    
    ]
    
}

struct MainTabView: View {
    var body: some View {
        TabView {
            
            ForEach(MainTabViewItems.items){ item in
                item.view.tabItem {
                    Label(item.title, systemImage: item.images.rawValue) }
            }
        }
    }
}

#Preview {
    MainTabView().environmentObject(Order())
}
