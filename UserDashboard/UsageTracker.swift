//
//  UsageTracker.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//


import SwiftUI
import Charts

struct DataUsageEntry: Identifiable {
    let id = UUID()
    let date: Date
    let dataUsed: Double // in MB
}

struct CountryUsage: Identifiable {
    let id = UUID()
    let country: String
    let dataRemaining: Double // in GB
}

struct UsageTracker: View {
    let usageData: [DataUsageEntry] = [
        DataUsageEntry(date: .now.addingTimeInterval(-5*86400), dataUsed: 450),
        DataUsageEntry(date: .now.addingTimeInterval(-4*86400), dataUsed: 320),
        DataUsageEntry(date: .now.addingTimeInterval(-3*86400), dataUsed: 760),
        DataUsageEntry(date: .now.addingTimeInterval(-2*86400), dataUsed: 580),
        DataUsageEntry(date: .now.addingTimeInterval(-1*86400), dataUsed: 640),
        DataUsageEntry(date: .now, dataUsed: 720)
    ]
    
    let countryData: [CountryUsage] = [
        CountryUsage(country: "France", dataRemaining: 0.5),
        CountryUsage(country: "Germany", dataRemaining: 1.2),
        CountryUsage(country: "USA", dataRemaining: 0.8),
        CountryUsage(country: "Japan", dataRemaining: 2.0)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with percentage and info
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("85%")
                        .font(.system(size: 34, weight: .bold))
                    HStack(spacing: 4) {
                        Text("1GB")
                            .font(.headline)
                        Text("Your data usage")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Text("7 days left until refresh")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            
            // Line chart card
            Chart {
                ForEach(usageData) { entry in
                    LineMark(
                        x: .value("Day", entry.date, unit: .day),
                        y: .value("MB Used", entry.dataUsed)
                    )
                    .interpolationMethod(.catmullRom)
                    PointMark(
                        x: .value("Day", entry.date, unit: .day),
                        y: .value("MB Used", entry.dataUsed)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisValueLabel(format: .dateTime.weekday(.abbreviated))
                }
            }
            .frame(height: 120)
            
            // Country data remaining history
            Text("Data Remaining by Country")
                .font(.headline)
                .padding(.top, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(countryData) { item in
                        VStack(spacing: 6) {
                            Text(item.country)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(UIColor.label))
                            Text("\(String(format: "%.1f", item.dataRemaining))GB left")
                                .font(.caption)
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        .padding(12)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.horizontal, -12)
            }
            .frame(height: 100)
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    UsageTracker()
}
