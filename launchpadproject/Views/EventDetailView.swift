// EventDetailView.swift

import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var eventData: EventData
    let event: Event
    @State private var isStarred: Bool
    
    init(event: Event) {
        self.event = event
        _isStarred = State(initialValue: event.isStarred)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text(event.description.isEmpty ? "No description was provided for this event." : event.description)
                    .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        Text(event.locationName.isEmpty ? "Location not added" : event.locationName)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "clock")
                        Text("\(formattedTime(event.startTime)) - \(formattedTime(event.endTime))")
                    }
                    .padding()
                }
                
                VStack(spacing: 10) {
                    Button {
                        eventData.toggleStar(event: event)
                        isStarred.toggle()
                    } label: {
                        Text(isStarred ? "You're in! ✅" : "RSVP")
                            .padding()
                            .background(isStarred ? Color.green : Color.red)
                            .foregroundColor(Color.white)
                        
                    }
                    NavigationLink(destination: MapView(selectedEvent: event)) {
                        Text("Show Location on Map")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .navigationTitle(event.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
