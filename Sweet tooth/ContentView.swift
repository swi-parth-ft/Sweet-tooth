//
//  ContentView.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    var body: some View {
        VStack {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
        }
        .padding()
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=queen&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedData.results
            }
            
        } catch {
            print("Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
