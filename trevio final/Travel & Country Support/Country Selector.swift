//
//  Country Selector.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//

import SwiftUI

struct Country_Selector: View {
    @State private var searchText = ""
    private let countries = ["France", "USA", "Germany", "Japan", "Canada", "Australia", "Italy", "UK"]

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search country", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                List {
                    ForEach(filteredCountries, id: \.self) { country in
                        NavigationLink(destination: PlanDetailView(country: country)) {
                            Text(country)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Select Country")
        }
    }

    var filteredCountries: [String] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct PlanDetailView: View {
    let country: String

    var body: some View {
        VStack(spacing: 20) {
            Text("Plans for \(country)")
                .font(.title)
                .bold()

            Text("Choose a plan and activate your Trevio eSIM")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle(country)
    }
}

#Preview {
    Country_Selector()
}
