//
//  Country.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//


import SwiftUI

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let flag: String
    let price: String
    @State private var searchText: String = ""
}

#Preview {
    DataPlanCountryListView()
}

struct DataPlanCountryListView: View {
    let topPicks: [Country] = [
        Country(name: "Turkey", flag: "🇹🇷", price: "$3.99"),
        Country(name: "United States", flag: "🇺🇸", price: "$3.99"),
        Country(name: "Thailand", flag: "🇹🇭", price: "$2.99"),
        Country(name: "Malaysia", flag: "🇲🇾", price: "$3.99"),
        Country(name: "United Arab Emirates", flag: "🇦🇪", price: "$3.99")
    ]

    let allDestinations: [Country] = [
        Country(name: "Afghanistan", flag: "🇦🇫", price: "$5.79"),
        Country(name: "Albania", flag: "🇦🇱", price: "$3.99"),
        Country(name: "Algeria", flag: "🇩🇿", price: "$6.99")
    ]

    @State private var searchText: String = ""

    var filteredTopPicks: [Country] {
        if searchText.isEmpty {
            return topPicks
        } else {
            return topPicks.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var filteredAllDestinations: [Country] {
        if searchText.isEmpty {
            return allDestinations
        } else {
            return allDestinations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack {
                    Text("Data plans")
                        .font(.title2.bold())
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }

                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .padding(.vertical, 10)
                }
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(12)

                // Toggle buttons
                HStack {
                    Text("Country")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)

                    Text("Regional")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .cornerRadius(20)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Top picks")
                            .font(.system(size: 22, weight: .bold))
                        ForEach(filteredTopPicks) { country in
                            NavigationLink(destination: PlanSelectionView(country: country)) {
                                CountryRow(country: country)
                            }
                        }

                        Text("All destinations")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.top)
                        ForEach(filteredAllDestinations) { country in
                            NavigationLink(destination: PlanSelectionView(country: country)) {
                                CountryRow(country: country)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct CountryRow: View {
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.flag)
            Text(country.name)
            Spacer()
            Text("From USD \(country.price)")
                .foregroundColor(.gray)
                .font(.subheadline)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct PlanOption: Identifiable {
    let id = UUID()
    let size: String
    let validity: String
    let price: String
    let isBestChoice: Bool
}

struct PlanSelectionView: View {
    let country: Country

    @State private var selectedPlanID: UUID?

    let plans: [PlanOption] = [
        PlanOption(size: "1 GB", validity: "7 days", price: "$3.99", isBestChoice: false),
        PlanOption(size: "3 GB", validity: "30 days", price: "$6.99", isBestChoice: false),
        PlanOption(size: "5 GB", validity: "30 days", price: "$9.99", isBestChoice: true),
        PlanOption(size: "10 GB", validity: "30 days", price: "$15.99", isBestChoice: false),
        PlanOption(size: "20 GB", validity: "30 days", price: "$22.99", isBestChoice: false),
        PlanOption(size: "Unlimited", validity: "15 days", price: "$49.99", isBestChoice: false)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Data plans")
                    .foregroundColor(.blue)
                Spacer()
                Text(country.name)
                    .font(.title2.bold())
            }

            Text("\(country.flag) Available plans")
                .font(.headline)

            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 180, height: 165)
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))

            ForEach(plans) { plan in
                VStack(alignment: .leading, spacing: 4) {
                    if plan.isBestChoice {
                        Text("Best choice")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    HStack {
                        Image(systemName: selectedPlanID == plan.id ? "largecircle.fill.circle" : "circle")
                            .onTapGesture {
                                selectedPlanID = plan.id
                            }
                        VStack(alignment: .leading) {
                            Text(plan.size)
                            Text(plan.validity)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("USD \(plan.price)")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(plan.isBestChoice ? Color.black : Color.gray.opacity(0.2), lineWidth: plan.isBestChoice ? 2 : 1)
                    )
                }
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Can I activate my plan later?")
                        .bold()
                }
                Text("All plans have a 30-day activation period. If you get a plan today and don't activate it until June 8, it will be activated automatically.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)

            Spacer()

            Button(action: {}) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color(red: 236/255, green: 236/255, blue: 236/255).ignoresSafeArea())
    }
}
