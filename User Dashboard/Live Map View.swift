//
//  Live Map View.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//

import SwiftUI
import MapKit

struct CountryData: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let pricePerGB: Double
    let remainingGB: Double
}

let sampleCountries: [CountryData] = [
    CountryData(name: "France", coordinate: .init(latitude: 48.8566, longitude: 2.3522), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "USA", coordinate: .init(latitude: 37.7749, longitude: -122.4194), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Japan", coordinate: .init(latitude: 35.6895, longitude: 139.6917), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Canada", coordinate: .init(latitude: 45.4215, longitude: -75.6972), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Brazil", coordinate: .init(latitude: -15.7939, longitude: -47.8828), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Germany", coordinate: .init(latitude: 52.52, longitude: 13.405), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "UK", coordinate: .init(latitude: 51.5074, longitude: -0.1278), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Italy", coordinate: .init(latitude: 41.9028, longitude: 12.4964), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "India", coordinate: .init(latitude: 28.6139, longitude: 77.209), pricePerGB: Double.random(in: 0.5...3), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "South Africa", coordinate: .init(latitude: -25.7461, longitude: 28.1881), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Russia", coordinate: .init(latitude: 55.7558, longitude: 37.6173), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "China", coordinate: .init(latitude: 39.9042, longitude: 116.4074), pricePerGB: Double.random(in: 1...4), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Mexico", coordinate: .init(latitude: 19.4326, longitude: -99.1332), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10)),
    CountryData(name: "Australia", coordinate: .init(latitude: -33.8688, longitude: 151.2093), pricePerGB: Double.random(in: 2...5), remainingGB: Double.random(in: 0.5...10))
]

struct Live_Map_View: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), // Paris
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    @State private var searchText = ""

    var filteredCountries: [CountryData] {
        if searchText.isEmpty {
            return sampleCountries
        } else {
            return sampleCountries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white.opacity(0.6))
                    TextField("Search country...", text: $searchText)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.top, 60)

                Spacer()
            }
            Map(coordinateRegion: $region, annotationItems: filteredCountries) { country in
                MapAnnotation(coordinate: country.coordinate) {
                    VStack(spacing: 4) {
                        Text(country.name)
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(country.remainingGB, specifier: "%.1f") GB")
                            .font(.caption2)
                            .foregroundColor(.green)
                        Text("$\(country.pricePerGB, specifier: "%.2f")/GB")
                            .font(.caption2)
                            .foregroundColor(.blue)
                    }
                    .padding(6)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(8)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    Live_Map_View()
}
