//  CreateEventView.swift
//  Created by Ayush on 14/11/2025.

import SwiftUI

struct CreateEventView: View {
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventName = ""
    @State private var eventDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Event Details") {
                    TextField("Event Name", text: $eventName)
                    DatePicker("Date", selection: $eventDate, displayedComponents: .date)
                    DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                    DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
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
                            endTime: endTime
                        )
                        eventData.addEvent(newEvent)
                        dismiss()
                    }
                    // add some sort of functionality to check that it doesn't add an event with incomplete data
                    // these are required fields
                }
            }
        }
    }
}
