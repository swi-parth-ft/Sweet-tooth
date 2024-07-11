//
//  CheckoutView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
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
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
            
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank You!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
        
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            if let response = try? JSONDecoder().decode(Order.self, from: data) {
                confirmationMessage = "your order for \(response.quatity)x \(Order.types[response.type].lowercased()) cupcakes is on it's way!"
                showingConfirmation = true
            } else {
                print("Failed to decode response")
            }
        } catch {
            print("Check out failed")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
