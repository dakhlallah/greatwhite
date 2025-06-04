//
//  InvestmentItem.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//


import SwiftUI

struct DataUsageItem: Identifiable {
    let id = UUID()
    let country: String
    let plan: String
    let usedPercentage: Int
    let validity: String
    let color: Color
}

struct EsimUsageSummaryView: View {
    let usages: [DataUsageItem] = [
        DataUsageItem(country: "France", plan: "5GB plan", usedPercentage: 75, validity: "7 days", color: .blue),
        DataUsageItem(country: "USA", plan: "10GB plan", usedPercentage: 40, validity: "30 days", color: .green),
        DataUsageItem(country: "Japan", plan: "3GB plan", usedPercentage: 90, validity: "15 days", color: .orange)
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color(red: 0.93, green: 0.95, blue: 1.0)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Trevio")
                        .font(.largeTitle).bold()
                    Text("Data Usage Summary")
                        .font(.title2).bold()
                    Text("Alaa Bouzid")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Text("May 2025")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                // Advisor row
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.gray)
                    Text("James, Your Financial Expert")
                        .font(.subheadline)
                    Spacer()
                    Button(action: {}) {
                        Text("Talk to me")
                            .font(.footnote.bold())
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }

                // Usage cards
                ForEach(usages) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(item.color)
                                    .frame(width: 8, height: 8)
                                Text(item.country)
                                    .font(.headline)
                            }
                            Text(item.plan)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("\(item.usedPercentage)% used")
                                .font(.largeTitle.bold())
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(item.validity)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 20)
                                .foregroundColor(item.color)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EsimUsageSummaryView()
}
