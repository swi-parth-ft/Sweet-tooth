//
//  CheckoutView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("your total cost is \(order.cost, format: .currency(code: "USD"))")
                
                Button("Place Order", action: {})
                    .padding()
            }
            
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    CheckoutView(order: Order())
}
