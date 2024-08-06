//
//  CheckoutView.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 6.08.2024.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
   // let paymentTypes: Array<PaymentType> = ["Cash", "Credit Card", "iDine Points"]
    
    @State private var paymentType: PaymentType = PaymentType.cash
    
    var body: some View {
        VStack {
            Section{
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(PaymentType.allCases, id: \.self){ item in
                        Text("\(item.rawValue)")
                        
                    }
                }.pickerStyle(.menu)
                
              
            }
            Button("Change"){
                paymentType = .dinePoints
            }
        }
    }
}


enum PaymentType: String, CaseIterable{
    case cash
    case creditCard
    case dinePoints
}

#Preview {
    CheckoutView().environmentObject(Order())
}
