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
    @State private var showingErrors = false
    @State private var errorMessage = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        ScrollView {
            VStack {
                //                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3) { image in
                //                    image
                //                        .resizable()
                //                        .scaledToFit()
                //                } placeholder: {
                //                    ProgressView()
                //                }
                //                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                
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
        .alert("Error", isPresented: $showingErrors) {
            Button("OK") {}
        } message: {
            Text(errorMessage)
        }
    }
    }
        
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode")
            return
        }
        UserDefaults.standard.set(encoded, forKey: "Order")
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, error) = try await URLSession.shared.upload(for: request, from: encoded)
            
            if let response = try? JSONDecoder().decode(Order.self, from: data) {
                confirmationMessage = "your order for \(response.quatity)x \(Order.types[response.type].lowercased()) cupcakes is on it's way!"
                showingConfirmation = true
            } else {
                print("Failed to decode response")
            }
        } catch {
            errorMessage = error.localizedDescription
            showingErrors = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
