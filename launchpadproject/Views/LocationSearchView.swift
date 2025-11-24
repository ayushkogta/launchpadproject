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
        VStack (alignment: .center) {
            TextField("Search location", text: $locationName)
                .onChange(of: locationName) { oldValue, newValue in
                    searchLocation(enteredLocation: newValue)
                }
            if !searchResults.isEmpty {
                ForEach(0..<3, id: \.self) { index in
                    if index < searchResults.count {
                        Button {
                            locationName = searchResults[index].name ?? ""
                            selectedCoordinate = searchResults[index].placemark.coordinate
                            searchResults = []
                        } label: {
                            VStack(alignment: .leading) {
                                Text(searchResults[index].name ?? "")
                                Text(searchResults[index].placemark.title ?? "")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    } else {
                        HStack {
                            Text("—")
                                .foregroundColor(.gray.opacity(0.3))
                            Spacer()
                        }
                        .frame(height: 40)
                    }
                }
            }
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
