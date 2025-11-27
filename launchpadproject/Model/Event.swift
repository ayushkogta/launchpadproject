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
            formatter.dateFormat = "MM dd, yyyy"
            return formatter.string(from: date)
        }
    }
    
    static let mockEvents: [Event] = [
        Event(name: "Beach Cleanup",
              date: Date(),
              startTime: Date(),
              endTime: Date().addingTimeInterval(3600)
              ),
        
        Event(name: "Book Club",
              date: Date(),
              startTime: Date(),
              endTime: Date().addingTimeInterval(14400)
        ),
        
        Event(name: "Free boba outside WALC!!",
              date: Date(),
              startTime: Date(),
              endTime: Date(),
              locationName: "Wilmeth Active Learning Center",
              locationCoordinate: CLLocationCoordinate2D(latitude: 40.42738610727535, longitude: -86.9137458493646)
             )
    ]
}
