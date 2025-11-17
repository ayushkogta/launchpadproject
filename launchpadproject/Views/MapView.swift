//  MapView.swift

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var eventData: EventData
    @State private var region: MKCoordinateRegion
    
    var selectedEvent: Event?
    
    init(selectedEvent: Event? = nil) {
        self.selectedEvent = selectedEvent
        
        let defaultCenter = CLLocationCoordinate2D(latitude: 40.425, longitude: -86.91)
        let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        
        
        if let event = selectedEvent {
            _region = State(initialValue: MKCoordinateRegion(center: event.locationCoordinate ?? CLLocationCoordinate2D(latitude: 40.425, longitude: -86.91), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
        } else {
            _region = State(initialValue: MKCoordinateRegion(center: defaultCenter, span: defaultSpan))
        }
    }
    
    var body: some View {
        NavigationView {
            Map(position: .constant(.region(region))) {
                ForEach(eventData.events.filter { $0.locationCoordinate != nil }) { event in
                    Annotation(event.name, coordinate: event.locationCoordinate!) {
                        NavigationLink(destination: EventDetailView(event: event)) {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                                .font(.title)
                        }
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                let eventsWithoutLocation = eventData.events.filter { $0.locationCoordinate == nil }.count
                if eventsWithoutLocation > 0 {
                    Text("\(eventsWithoutLocation) event(s) without a location")
                        .padding()
                        .background(.white)
                }
            }
            .navigationTitle("Events Map")
        }
    }
}
