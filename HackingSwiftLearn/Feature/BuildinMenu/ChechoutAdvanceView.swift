//
//  ChechoutAdvanceView.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 6.08.2024.
//

import SwiftUI

struct ChechoutAdvanceView: View {
    
    @State private var paymentType: PaymentType = PaymentType.cash
    @EnvironmentObject var order: Order
       
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber = ""
    let tipAmounts = [10,15,20,25,0]
    @State private var tipAmount = 15
       
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
       
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(PaymentType.allCases, id: \.self) { item in
                            Text("\(item.rawValue)")
                        }
                    }.pickerStyle(.navigationLink)
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyalityDetails.animation())
                   
                if(addLoyalityDetails) {
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                }
                   
                Section("Add a tip?") {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                   
                Section("Total: \(totalPrice)") {
                    Button("Confirm Order") {
                           // place order
                    }
                }
            }.navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ChechoutAdvanceView()
        .environmentObject(Order().dummyInit())
}
