//
//  ItemDetailView.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 30.07.2024.
//

import SwiftUI

struct ItemDetailView: View {
    
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5,y: -5)
                
            }
            Text(item.description)
                .padding()
            
            Button("Order This"){
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ItemDetailView(item: MenuItem.example)
    }
}
