//  EventRow.swift

import SwiftUI
struct EventRow: View {
    @EnvironmentObject var eventData: EventData
    let event: Event
    
    var body: some View {
        HStack(alignment: .top) {
            // add the image for the event here
            
            VStack(alignment: .leading, spacing: 2) {
                Text(event.name)
                    .font(.headline)
                // Do stylistic changes later
                
                HStack {
                    Image(systemName: "mappin.circle")
                    HStack {
                        Image(systemName: "mappin.circle")
                        Text(event.locationName.isEmpty ? "Location TBD" : event.locationName)
                    }
                }
                .font(.caption)
                .foregroundColor(.gray)
                Text("\(formattedTime(event.startTime)) - \(formattedTime(event.endTime))")
                    .font(.caption)
                    .foregroundColor(.gray)
                // Do stylistic changes later
            }
            
            Spacer()
            Image(systemName: event.isStarred ? "star.fill" : "star")
                .foregroundColor(.yellow)
                .onTapGesture {
                    eventData.toggleStar(event: event)
                }
        }
        .padding(.vertical, 4)
    }
    
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
