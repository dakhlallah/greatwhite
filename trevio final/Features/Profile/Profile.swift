//
//  Profile.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//

import SwiftUI

struct Profile: View {
    @State private var marketingOptIn = true
    @State private var showAccountSettings = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Text("Profile")
                    .font(.title2)
                    .fontWeight(.bold)

                // Email + Logout
                VStack(alignment: .leading, spacing: 12) {
                    Text("Your email address")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)

                    Text("hello@greatwhite.me")
                        .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))

                    Button(action: {}) {
                        Text("Log out")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(30)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                // Business Sign-up
                Button(action: {}) {
                    HStack {
                        Text("Sign up for Trevio Business")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                // Marketing Opt-In
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Marketing communication")
                            .fontWeight(.semibold)
                        Text("Enable this option to receive exclusive Trevio offers and promotions.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Toggle("", isOn: $marketingOptIn)
                        .labelsHidden()
                }
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93)) // #ECECEC
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                // Static links
                Group {
                  ForEach(["Terms of service", "Privacy policy"], id: \.self) { label in
                        Button(action: {}) {
                            HStack {
                                Text(label)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                    }
                }

                // Account Settings Disclosure
                DisclosureGroup("Account settings", isExpanded: $showAccountSettings) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Delete Account")
                            .fontWeight(.semibold)

                        Text("By deleting your account, you’ll lose access to your eSIM plans.")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Button(action: {}) {
                            Text("Delete")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(30)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                    }
                    .padding(.top, 8)
                }
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93)) // #ECECEC
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                Spacer()
            }
            .padding()
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.95).ignoresSafeArea())
    }
}

#Preview {
    Profile()
}
