//
//  DisplayDetailScreenWithNavigation.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 30.07.2024.
//

import SwiftUI

struct DisplayDetailScreenWithNavigation: View {
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
                            NavigationLink {
                                ItemDetailView(item: item)
                            } label: {
                                ItemSubRow(item: item)

                            }
                            
                        }
                    } header: {
                        Text(section.name)
                            .font(.headline)
                    }

                }
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                ItemDetailView(item: item)
            })
            .navigationTitle("Menu")
            .listStyle(.grouped)
            
        }
    }
}

private struct ItemSubRow: View {
    let item: MenuItem
    private let circle = Circle()
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .circleShapeWithBorder()
            VStack(alignment: .leading) {
             
                Text(item.name)

                HStack {
                    Text("\(item.price)$")
                    Spacer()
                    ForEach(item.restrictions, id: \.self){ restrication in
                        Text(restrication)
                            .restricStyle()
                            .background(RestirctionColor.color(value: restrication))
                    }
                }
                
            }
        }
    }
}


struct DisplayDetailScreenWithNavigation_Previews: PreviewProvider {
    static var previews: some View {
        DisplayDetailScreenWithNavigation()
    }
}


private extension Text{
    func restricStyle() -> some View {
        return self   .font(.caption)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(5)
        
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
    }
}



private enum RestirctionColor: String{
    case D
    case G
    case N
    case V
    
    static func color(value: String) -> Color {
        switch value{
        case RestirctionColor.D.rawValue:
            return Color.purple
        case RestirctionColor.G.rawValue:
            return Color.black
        case RestirctionColor.N.rawValue:
            return Color.blue
        case RestirctionColor.V.rawValue:
            return Color.green
        default:
            return Color.black
        }
    }

}








#Preview {
    PolishingDesingWithColor()
}

