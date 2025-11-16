// EventListView.swift
// view should be stupid - does as displayed not something to figure out

import SwiftUI

struct EventListView: View {
    
    @EnvironmentObject var eventData: EventData
    @State private var showingCreateEventSheet = false

    // this groups events into a dictionary where key is dayText
    private var groupedEvents: [String: [Event]] {
        Dictionary(grouping: eventData.events) { $0.dayText }
    }
    
    private var sortedKeys: [String] {
        groupedEvents.keys.sorted { (key1, key2) -> Bool in
            if key1 == "Today" { return true }
            if key2 == "Today" { return false }
            if key1 == "Tomorrow" { return true }
            if key2 == "Tomorrow" { return false }
            
            return key1 < key2
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedKeys, id: \.self) { dayText in
                
                    Section(header: Text("\(dayText) | \(formattedDate(for: dayText))").font(.callout)) {
                        ForEach(groupedEvents[dayText] ?? []) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                EventRow(event: event)
                            }
                        }
                    }
                }
            }
            .navigationTitle("All Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingCreateEventSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $showingCreateEventSheet) {
                CreateEventView()
                    .environmentObject(eventData)
            }
        }
    }
    
    func formattedDate(for dayText: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        
        if dayText == "Today" || dayText == "Tomorrow" {
            return ""
        }
        return dayText
    }
}
