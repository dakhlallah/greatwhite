//
//  ActivityKit.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//

import SwiftUI

struct TrevioESIMStatusCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Trevio Plan")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.6))
                Spacer()
                HStack(spacing: 6) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Andy")
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.6))
                }
            }

            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("France")
                        .font(.headline)
                        .bold()
                    Text("1.5 GB used")
                        .foregroundColor(Color(red: 0.85, green: 0.2, blue: 0.2))
                    Text("Last sync 15m ago")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.6))
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("2.5 GB remaining")
                        .foregroundColor(Color(red: 0.85, green: 0.2, blue: 0.2))
                    Text("USA")
                        .font(.headline)
                        .bold()
                    Text("Next reset in 6h")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.6))
                }
            }

            Divider()

            HStack {
                (
                    Text("Plan expires in ")
                        .font(.footnote)
                    +
                    Text("6 days")
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.85, green: 0.2, blue: 0.2))
                )
                Spacer()
                HStack(spacing: 6) {
                    Image(systemName: "figure.walk.circle.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("eSIM #789A")
                        .font(.footnote)
                        .bold()
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(red: 0.98, green: 0.84, blue: 0.25))
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(red: 0.96, green: 0.96, blue: 0.98))
        .cornerRadius(20)
        .shadow(radius: 2)
        .padding()
    }
}

#Preview {
    TrevioESIMStatusCard()
}
