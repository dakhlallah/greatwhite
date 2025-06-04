//
//  Help.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//

import SwiftUI

struct Help: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)

            Circle()
                .fill(Color.blue.opacity(0.15))
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: "questionmark")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                )

            Text("Any issues?")
                .font(.title2)
                .fontWeight(.bold)

            Text("We’ll try to help you.")
                .font(.subheadline)
                .foregroundColor(.gray)

            VStack(spacing: 16) {
                HelpOption(icon: "paperplane.fill", title: "Getting started with Trevio")
                HelpOption(icon: "creditcard.fill", title: "Account and payments")
                HelpOption(icon: "wrench.and.screwdriver.fill", title: "Troubleshooting")
            }
            .padding(.top, 24)

            Spacer()
        }
        .padding()
    }
}

struct HelpOption: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Circle()
                .fill(Color.blue.opacity(0.15))
                .frame(width: 36, height: 36)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                )

            Text(title)
                .font(.body)
                .fontWeight(.medium)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.03), radius: 2, x: 0, y: 2)
    }
}

#Preview {
    Help()
}
