//
//  ChechoutAdvanceView.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 6.08.2024.
//

import SwiftUI

struct ChechoutAdvanceView: View {
    
    @State private var paymentType: PaymentType = PaymentType.cash
    
    @State private var addLoyalityDetails: Bool = false
    @State private var loyalityNumber = ""
    @State private var tipAmmounts: TipAmmounts = .zero
    
    
    func checkValidaton() -> Bool {
        if tipAmmounts == .zero{
            return false
        }
        if loyalityNumber.isEmpty{
            return false
        }
        return true
    }
    

    var body: some View {
        NavigationView{
            Form {
                Section{
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(PaymentType.allCases, id: \.self){ item in
                            Text("\(item.rawValue)")
                            
                        }
                    }.pickerStyle(.navigationLink)
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyalityDetails.animation())
                
                if(addLoyalityDetails){
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                    Picker("Tips", selection: $tipAmmounts) {
                        ForEach(TipAmmounts.allCases, id: \.self){ item in
                            Text("\(item.rawValue.description)")
                            
                        }
                    }.pickerStyle(.menu)
                }
                
                
                
                Spacer()
                Button{
                    
                }label: {
                    Text("Complete")
                }
                
            }.navigationTitle("Payment")

        }.padding(.all, 8)
    }
}

#Preview {
    ChechoutAdvanceView()
}


enum TipAmmounts: Int, CaseIterable{
    case ten = 10
    case fiftten = 15
    case twenty = 20
    case twentyFive = 25
    case zero = 0
}
