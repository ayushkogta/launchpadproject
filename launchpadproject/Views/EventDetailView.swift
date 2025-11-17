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
                // visual layout here (image, title, description)
                
                Text("Event description here")
                // Do stylistic changes later
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        Text("Location to be added") // fix this later when implementing MapView
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        Text("\(formattedTime(event.startTime)) - \(formattedTime(event.endTime))")
                    }
                }
                // may have to do stylistic changes here when testing (e.g. padding, horizontal vs vertical, color
                
                VStack(spacing: 10) {
                    Button {
                        eventData.toggleStar(event: event)
                        isStarred.toggle()
                    } label: {
                        Text(isStarred ? "You're in! ✅" : "RSVP")
                            .padding()
                            .background(isStarred ? Color.green : Color.red)
                            .foregroundColor(Color.white)
                            // Do stylistic changes later
                    }
                    NavigationLink(destination: MapView(selectedEvent: event)) {
                        Text("Show Location on Map")
                            .padding()
                            .background(Color.gray)
                            // Do stylistic changes later
                    }
                }
                .padding()
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
