//
//  ContentView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    
    @State private var engine: CHHapticEngine?
    @State private var isAddressViewPresented = false
    @State private var order = Order()
    var body: some View {
        NavigationStack {
            ZStack {
                
                
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                if order.extraFrosting {
                    SnowView()
                        
                }
                
                
                
                
                Form {
                    Section("Select your cake") {
                        Picker("Select your cake type", selection: $order.type) {
                            ForEach(Order.types.indices, id: \.self) {
                                Text(Order.types[$0])
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 100)
                        .listRowBackground(Color.white.opacity(0.5))
                        
                        
                        //                        Stepper("Number of cakes: \(order.quatity)", value: $order.quatity, in: 3...20)
                        //                            .listRowBackground(Color.white.opacity(0.5))
                        
                        HStack() {
                            Button {
                                order.quatity -= 1
                            } label: {
                                Image(systemName: "minus.circle")
                                    .font(.system(size: 42, weight: .heavy))
                                    .foregroundColor(.orange.opacity(0.5))
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                            Text("\(order.quatity)")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 70))
                                .keyboardType(.decimalPad)
                                .tint(.green)
                                .padding()
                                .frame(width: 150, height: 150)
                                .animation(.smooth)
                            
                            Button {
                                order.quatity += 1
                            } label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 42, weight: .heavy))
                                    .foregroundColor(.orange.opacity(0.5))
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        .frame(width: 350, height: 80)
                        .listRowBackground(Color.white.opacity(0.5))
                    }
                    
                    Section {
                        Toggle("Any Special requests?", isOn: $order.specialRequestEnabled)
                            .listRowBackground(Color.white.opacity(0.5))
                        if order.specialRequestEnabled {
                            Toggle("Add extra frosting", isOn: $order.extraFrosting)
                            Toggle("Add extra sprinles", isOn: $order.addSprinkles)
                            
                            
                               
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.5))
                    
                    
                    Section {
                        Button("Delivery details") {
                           // AddressView(order: order)
                            isAddressViewPresented = true
                            complexSuccess()
                        }
                        .tint(.orange)
                        .onAppear {
                            prepareHaptics()
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.5))
                    
                    
                }
                .navigationTitle("Sweet Tooth")
                .scrollContentBackground(.hidden)
                .shadow(radius: 15)
                .sheet(isPresented: $isAddressViewPresented) {
                    // show an AddView here
                    AddressView1(order: order)
                        .presentationDetents([.fraction(0.4), .medium, .large])
                }
                
//                if !order.addSprinkles {
//                    MashSprinkle()
//                        .listRowBackground(Color.white.opacity(0))
//                        .ignoresSafeArea()
//                        
//                }
                
                FallingSprinklesView(isEnabled: $order.addSprinkles)
                    .edgesIgnoringSafeArea(.all)
                
                
            }
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creatng the engine")
        }
        
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern")
        }
    }
}


struct AddressView1: View {
    
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack {
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
                        NavigationLink {
                            CheckoutView(order: order)
                                .presentationDetents([.large])
                        } label: {
                            Button("Next") {}
                        }
                        
                    }
                    .disabled(order.hasValidAddress == false)
                    .listRowBackground(Color.white.opacity(0.5))
                }
                .scrollContentBackground(.hidden)
                
              
            }
        }
    }
}

#Preview {
    ContentView()
}
