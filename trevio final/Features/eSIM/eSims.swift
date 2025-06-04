//
//  eSims.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//

import SwiftUI

struct eSims: View {
    @State private var hasInternet = true
    @State private var hasPlans = false

    var body: some View {
        ZStack {
            Color(red: 236/255, green: 236/255, blue: 236/255).ignoresSafeArea()

            if !hasInternet {
                VStack(spacing: 24) {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 120, height: 120)
                        .overlay(
                            Image(systemName: "exclamationmark")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                        )

                    Text("No internet connection")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text("You need to be online to access the app. But you can still check the instructions on how to use your eSIM.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .padding(.horizontal)

                    Button("View instructions") {
                        // action
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(24)
                }
                .padding()
            } else if !hasPlans {
                VStack(spacing: 24) {
                    Image("image paris") // Add this image to Assets
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())

                    Text("No data plans... yet!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text("Purchase a plan for it to appear here.")
                        .font(.subheadline)
                        .foregroundColor(.black)

                    NavigationLink(destination: DataPlanCountryListView()) {
                        Text("Explore plans")
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(24)
                    }
                }
                .padding()
            } else {
                // show user's eSIM plan list
                Text("Your data plans will appear here.")
            }
        }
    }
}

#Preview {
    eSims()
}
