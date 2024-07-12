//
//  AddressView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                .listRowBackground(Color.white.opacity(0.5))
                
                Section {
                    NavigationLink("Check out") {
                        CheckoutView(order: order)
                    }
                    
                }
                .disabled(order.hasValidAddress == false)
                .listRowBackground(Color.white.opacity(0.5))
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
