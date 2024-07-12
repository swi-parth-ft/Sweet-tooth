//
//  Sprinkle.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI

struct Sprinkle: View {
    var angle: Double

    var body: some View {
        HStack {
            VStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.random)
                    .frame(width: 25, height: 5)
                    .rotationEffect(.degrees(angle))
                Spacer()
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.random)
                    .frame(width: 25, height: 5)
                    .rotationEffect(.degrees(angle - 25))
                Spacer()
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.random)
                    .frame(width: 25, height: 5)
                    .rotationEffect(.degrees(angle + 10))
            }
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.random)
                    .frame(width: 25, height: 5)
                    .rotationEffect(.degrees(angle))
                Spacer()
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.random)
                    .frame(width: 25, height: 5)
                    .rotationEffect(.degrees(angle + 10))
                Spacer()
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.random)
                    .frame(width: 25, height: 5)
                    .rotationEffect(.degrees(angle - 10))
                Sprinke()
            }
        }
        .frame(width: 190, height: 170)
        
        
    }
}

struct Sprinke: View {
    
    var angle = Int.random(in: 0...360)
    var angle2 = Int.random(in: 0...360)
    var angle3 = Int.random(in: 0...360)
    var angle4 = Int.random(in: 0...360)
    
    var body: some View {
        
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.random)
                .frame(width: 25, height: 5)
                .rotationEffect(.degrees(Double(angle - 10)))
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.random)
                .frame(width: 25, height: 5)
                .rotationEffect(.degrees(Double(angle2 - 10)))
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.random)
                .frame(width: 25, height: 5)
                .rotationEffect(.degrees(Double(angle3 - 10)))
        
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.random)
            .frame(width: 25, height: 5)
            .rotationEffect(.degrees(Double(angle4 - 10)))
        
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.random)
            .frame(width: 25, height: 5)
            .rotationEffect(.degrees(Double(angle2 - 10)))
        
        
    }
    
}

struct MashSprinkle: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Sprinke()
                Sprinke()
                Sprinke()
                Sprinke()
                Sprinke()
                Sprinke()
                Sprinke()
            }
            ZStack {
                HStack(spacing: 1) {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
                HStack {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
            }
            
            ZStack {
                HStack(spacing: -2) {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
                HStack {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
            }
            
            ZStack {
                HStack(spacing: -7) {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
                HStack {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
            }
            
            ZStack {
                HStack(spacing: -9) {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
                HStack {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
            }
            
            ZStack {
                HStack(spacing: -11) {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
                HStack {
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                    Sprinke()
                }
            }

        }
        .background(.white.opacity(0))
        
    }
}

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}



#Preview {
   // Sprinkle(angle: 5)
    MashSprinkle()
}
