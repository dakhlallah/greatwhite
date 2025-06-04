//
//  DashboardScreen.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//

import SwiftUI
import UIKit

struct DashboardScreen: View {
    let currentPlan = "France 5GB / 30 days"
    let location = "Paris, France"
    let remainingData = "2.4 GB remaining"

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(alignment: .center, spacing: 12) {
                    Button(action: {
                        // TODO: handle back navigation
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color(UIColor.label))
                    }
                    Text("Trevio Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor.label))
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)

                DashboardCard(
                    icon: "simcard",
                    title: "Current Plan",
                    value: currentPlan
                )

                DashboardCard(
                    icon: "mappin.and.ellipse",
                    title: "Location",
                    value: location
                )

                DashboardCard(
                    icon: "antenna.radiowaves.left.and.right",
                    title: "Data Balance",
                    value: remainingData
                )
            }
            .padding(.horizontal)
        }
        .background(Color(UIColor.systemBackground).ignoresSafeArea())
    }
}

struct DashboardCard: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(Color(UIColor.systemBlue))
                .frame(width: 40, height: 40)
                .background(Color(UIColor.systemBlue).opacity(0.1))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                Text(value)
                    .font(.headline)
                    .foregroundColor(Color(UIColor.label))
            }

            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    DashboardScreen()
}
