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
            }
        }
        .frame(width: 190, height: 170)
        
        
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
    Sprinkle(angle: 5)
}
