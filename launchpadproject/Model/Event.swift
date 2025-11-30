//  Event.swift

import SwiftUI
import CoreLocation

struct Event: Identifiable {
    let id = UUID()
    var name: String
    var date: Date
    var startTime: Date
    var endTime: Date
    var description: String = ""
    var locationName: String = ""
    var locationCoordinate: CLLocationCoordinate2D?
    // unfinished. likely adding location details (e.g. name, coords), capacity
    
    var isStarred: Bool = false
    
    var dayText: String {
        let formatter = DateFormatter()
        if Calendar.current.isDateInToday(date) {
            return "Today"
        } else if Calendar.current.isDateInTomorrow(date){
            return "Tomorrow"
        } else {
            formatter.dateFormat = "MMMM dd, yyyy"
            return formatter.string(from: date)
        }
    }
    
    static let mockEvents: [Event] = [
        Event(name: "Beach Cleanup",
              date: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 5))!,
              startTime: Calendar.current.date(from:DateComponents(hour: 9, minute: 0))!,
              endTime: Calendar.current.date(from:DateComponents(hour: 9, minute: 0))!.addingTimeInterval(3600)
              ),
        
        Event(name: "Book Club",
              date: Date(),
              startTime: Calendar.current.date(from:DateComponents(hour: 19, minute: 0))!,
              endTime: Calendar.current.date(from:DateComponents(hour: 19, minute: 0))!.addingTimeInterval(14400),
              description: "We are the Boiler Book Club - The Largest Book Club at Purdue. We meet every Friday at 7pm in the West Lafayette Public Library. Come join us for our next meeting!",
              locationName: "West Lafayette Public Library",
              locationCoordinate:  CLLocationCoordinate2D(latitude: 40.42513015334338, longitude: -86.90749528489997)
        ),
        
        Event(name: "Free boba outside WALC",
              date: Date(),
              startTime: Calendar.current.date(from:DateComponents(hour: 21, minute: 0))!,
              endTime: Calendar.current.date(from:DateComponents(hour: 23, minute: 30))!,
              description: "The Purdue Boba Association (PBA) is giving out free boba outside WALC to celebrate their 5th anniversary!",
              locationName: "Wilmeth Active Learning Center",
              locationCoordinate: CLLocationCoordinate2D(latitude: 40.42738610727535, longitude: -86.9137458493646)
             ),
        
        Event(name: "T-shirt Giveaway",
              date: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 8))!,
              startTime: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 5, hour: 10, minute: 0))!,
              endTime: Calendar.current.date(from: DateComponents(year: 2025, month: 12, day: 5, hour: 12, minute: 0))!,
              locationName: "Beering Hall",
              locationCoordinate: CLLocationCoordinate2D(latitude: 40.425559370036545, longitude: -86.91631270751253))
    ]
}
