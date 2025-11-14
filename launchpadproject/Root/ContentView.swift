// ContentView.swift

import SwiftUI

struct ContentView: View {
    // todo should i be adding @StateObject var eventData = eventData()
    
    var body: some View {
        TabView {

            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            EventListView()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("Events")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .environmentObject(eventData)
    }
}

#Preview {
    ContentView()
}
