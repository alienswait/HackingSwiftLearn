//
//  OrderViewEnviroment.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 31.07.2024.
//
import SwiftUI

struct OrderViewEnvironment: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Place Order") {
                        ChechoutAdvanceView()
                            .environmentObject(order)
                        
                    }
                }
                
            }
            .navigationTitle("Order")
        }
    }
}

struct COrderViewEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        OrderViewEnvironment().environmentObject(
            Order().dummyInit())
    }
}
