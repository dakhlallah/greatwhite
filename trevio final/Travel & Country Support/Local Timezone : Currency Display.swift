//
//  Local Timezone : Currency Display.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//

import SwiftUI

struct Local_Timezone___Currency_Display: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)

            Text("Your Local Settings")
                .font(.title2)
                .fontWeight(.bold)

            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Timezone:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(TimeZone.current.identifier)
                }

                HStack {
                    Text("Currency:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(Locale.current.currencySymbol ?? "$")
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)

            Spacer()
        }
        .padding()
        .navigationTitle("Locale Info")
    }
}

#Preview {
    Local_Timezone___Currency_Display()
}
