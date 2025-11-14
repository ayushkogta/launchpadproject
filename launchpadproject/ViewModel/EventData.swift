// EventData.swift

import SwiftUI

class EventData: ObservableObject {
    
    @Published var events: [Event] = Event.mockEvents
    
    // Toggle an event to be starred/RSVP'd
    func toggleStar(event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].isStarred.toggle()
        }
    }
    
    // function to add event
    func addEvent(_ event: Event) {
        events.append(event)
        // sorting them so that they stay organized by date
        events.sort { $0.startTime < $1.startTime }
        
    }
    
    
    // filtering tool to show only starred events
    var starredEvents: [Event] {
        events.filter { $0.isStarred }
    }
    
    
}
// todo this file
