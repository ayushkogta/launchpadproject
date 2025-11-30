//  CreateEventView.swift
//  Created by Ayush on 14/11/2025.

import SwiftUI
import MapKit

struct CreateEventView: View {
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventName = ""
    @State private var eventDescription = ""
    @State private var eventDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var locationName = ""
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    
    var isValidEvent: Bool {
        !eventName.isEmpty && startTime < endTime
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Event Details") {
                    TextField("Event Name", text: $eventName)
                    DatePicker("Date", selection: $eventDate, displayedComponents: .date)
                    DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                    DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                    TextField("Description (optional)", text: $eventDescription, axis: .vertical)
                        .lineLimit(3...6)
                    Section("Location (optional)") {
                        LocationSearchView(locationName: $locationName, selectedCoordinate: $selectedCoordinate)
                    }
                    
                }
            }
            .navigationTitle("Create Event")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newEvent = Event(
                            name: eventName,
                            date: eventDate,
                            startTime: startTime,
                            endTime: endTime,
                            description: eventDescription,
                            locationName: locationName,
                            locationCoordinate: selectedCoordinate
                        )
                        eventData.addEvent(newEvent)
                        dismiss()
                    }
                    .disabled(!isValidEvent)
                }
            }
        }
    }
}
