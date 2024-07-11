//
//  ContentView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI


struct ContentView: View {
    
    
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading the picture")
            } else {
                ProgressView()
            }
            
        }
        .frame(width: 200)
        
    }
}
#Preview {
    ContentView()
}
