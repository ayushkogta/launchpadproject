//
//  ContentView.swift
//  launchpadproject
//
//  Created by Ayush on 20/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Map view placeholder")
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            EventListView()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("Events")
                }
            
            Text("Profile placeholder")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
