//
//  FallingSprinklesView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI

struct FallingSprinklesView: View {
    @Binding var isEnabled: Bool
    @State private var sprinkles: [UUID] = []
    @State private var sprinklePositions: [UUID: CGPoint] = [:]
    @State private var sprinkleAngles: [UUID: Double] = [:]
    @State private var sprinkleOpacities: [UUID: Double] = [:]
    let sprinkleCount = 20
    let verticalSpacing: CGFloat = 50  // Adjust this value for more or less spacing

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isEnabled {
                    ForEach(sprinkles, id: \.self) { id in
                        Sprinkle(angle: sprinkleAngles[id] ?? 0)
                            .position(sprinklePositions[id] ?? CGPoint(x: -10, y: -10))
                            .opacity(sprinkleOpacities[id] ?? 1)
                            .onAppear {
                                if sprinklePositions[id]?.y == -10 {
                                    sprinklePositions[id] = CGPoint(x: .random(in: 0...geometry.size.width),
                                                                    y: -10)
                                }
                                withAnimation(Animation.linear(duration: 3)) {
                                    sprinklePositions[id]?.y = geometry.size.height + 10
                                }
                                withAnimation(Animation.linear(duration: 0.5).delay(2)) {
                                                                    sprinkleOpacities[id] = 0  // Hide sprinkle after 3 seconds
                                                                }
                            }
                    }
                }
            }
            .onAppear {
                if isEnabled {
                    startSprinkling(in: geometry.size)
                }
            }
            .onChange(of: isEnabled) { newValue in
                if newValue {
                    startSprinkling(in: geometry.size)
                } else {
                    sprinkles.removeAll()
                    sprinklePositions.removeAll()
                    sprinkleAngles.removeAll()
                    sprinkleOpacities.removeAll()
                }
            }
        }
    }

    func startSprinkling(in size: CGSize) {
        for i in 0..<sprinkleCount {
            let id = UUID()
            sprinkles.append(id)
            let startY = -CGFloat(i) * verticalSpacing  // Increase space between initial Y positions
            sprinklePositions[id] = CGPoint(x: .random(in: 0...size.width), y: startY)
            sprinkleAngles[id] = .random(in: -45...45)  // Assign a random angle between -45 and 45 degrees
            sprinkleOpacities[id] = 1
        }
    }
}
