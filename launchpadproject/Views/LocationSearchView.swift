//
//  LocationSearchView.swift
//  launchpadproject
//
//  Created by Ayush on 23/11/2025.
//

import SwiftUI
import MapKit

struct LocationSearchView: View {
    @Binding var locationName: String
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Search location", text: $locationName)
                .onChange(of: locationName) { oldValue, newValue in
                    searchLocation(enteredLocation: newValue)
                }
            
            List {
                ForEach(Array(searchResults.prefix(3)), id: \.self) { item in
                    Button {
                        locationName = item.name ?? ""
                        selectedCoordinate = item.placemark.coordinate
                        DispatchQueue.main.async {
                            searchResults = []
                        }
                    } label: {
                        VStack(alignment: .leading) {
                            Text(item.name ?? "")
                            Text(item.placemark.title ?? "")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .frame(height: searchResults.isEmpty ? 0 : 150)
        }
    }
    
    func searchLocation(enteredLocation: String) {
        if enteredLocation.isEmpty {
            searchResults = []
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = enteredLocation
        request.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.425, longitude: -86.91),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let response = response {
                searchResults = response.mapItems
            }
        }
    }
}
