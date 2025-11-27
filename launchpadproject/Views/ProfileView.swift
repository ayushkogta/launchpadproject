//  ProfileView.swift

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var eventData: EventData
    
    var body: some View {
        NavigationView {
            if eventData.starredEvents.isEmpty {
                VStack {
                    Text("RSVP an event for it to show up here!")
                }
                .navigationTitle("Profile")
            } else {
                List {
                    ForEach(eventData.starredEvents) { event in
                        NavigationLink(destination: EventDetailView(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .navigationTitle("Profile (RSVPs)")
            }
        }
    }
}
