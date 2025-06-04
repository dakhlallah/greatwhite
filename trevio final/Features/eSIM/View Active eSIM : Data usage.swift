//
//  View Active eSIM : Data usage.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//

import SwiftUI

struct View_Active_eSIM___Data_usage: View {
    @State private var dataUsed: Double = 4.2
    @State private var dataRemaining: Double = 3.8
    @State private var validity: String = "Expires in 6 days"
    @State private var planName: String = "France Plan - 8GB"
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                Picker("View", selection: $selectedTab) {
                    Text("Current Plan").tag(0)
                    Text("History").tag(1)
                    Text("Top-Up").tag(2)
                    Text("Manage").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.top, 16)
                
                if selectedTab == 0 {
                    VStack(spacing: 2) {
                        Text(planName)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)

                        Text(validity)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.15), lineWidth: 18)

                        Circle()
                            .trim(from: 0.0, to: CGFloat(dataUsed / (dataUsed + dataRemaining)))
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.cyan]),
                                    center: .center
                                ),
                                style: StrokeStyle(lineWidth: 18, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))

                        VStack(spacing: 4) {
                            Text(String(format: "%.1f", dataUsed + dataRemaining) + " GB")
                                .font(.title.bold())
                            Text("Total Plan")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 220, height: 220)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)

                    HStack(spacing: 16) {
                        StatCard(title: "Used", value: String(format: "%.1f GB", dataUsed), color: .red)
                        StatCard(title: "Remaining", value: String(format: "%.1f GB", dataRemaining), color: .green)
                    }
                    .padding(.horizontal)

                    Spacer()
                } else if selectedTab == 1 {
                    VStack(spacing: 16) {
                        ForEach(0..<5) { index in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Plan \(index + 1)")
                                    .font(.headline)
                                Text("Used 3.5 GB • Remaining 1.2 GB")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("Expired 5 days ago")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                            )
                            .shadow(color: .black.opacity(0.02), radius: 1, x: 0, y: 1)
                        }
                    }
                    .padding(.horizontal)
                } else if selectedTab == 2 {
                    VStack(spacing: 24) {
                        Text("Top-Up / Extend Plan")
                            .font(.title2)
                            .fontWeight(.semibold)

                        VStack(spacing: 16) {
                            Button(action: {
                                // Handle 1 GB top-up
                            }) {
                                Text("Buy 1 GB for $3.99")
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.blue)
                                    )
                                    .foregroundColor(.white)
                                    .shadow(color: .blue.opacity(0.2), radius: 4, x: 0, y: 2)
                            }

                            Button(action: {
                                // Handle 7-day extension
                            }) {
                                Text("Extend Validity by 7 Days for $2.99")
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.green)
                                    )
                                    .foregroundColor(.white)
                                    .shadow(color: .green.opacity(0.2), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding()
                } else if selectedTab == 3 {
                    VStack(spacing: 24) {
                        Text("Manage eSIM")
                            .font(.title2)
                            .fontWeight(.semibold)

                        VStack(spacing: 16) {
                            Button(action: {
                                // Handle delete eSIM
                            }) {
                                Text("Delete This eSIM")
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.red)
                                    )
                                    .foregroundColor(.white)
                                    .shadow(color: .red.opacity(0.2), radius: 4, x: 0, y: 2)
                            }

                            Button(action: {
                                // Handle switch eSIM
                            }) {
                                Text("Switch to Another eSIM")
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.orange)
                                    )
                                    .foregroundColor(.white)
                                    .shadow(color: .orange.opacity(0.2), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)

                        Spacer()
                    }
                    .padding()
                }
            }
            .padding(.bottom, 16)
            .navigationTitle("eSIM Usage")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Back action here
                    }) {
                        Image(systemName: "chevron.left")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Navigate to history
                    }) {
                        Label("History", systemImage: "clock")
                            .font(.footnote.weight(.medium))
                    }
                }
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.title3.bold())
                .foregroundColor(color)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.systemGray6))
        )
        .shadow(color: .black.opacity(0.03), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    View_Active_eSIM___Data_usage()
}
