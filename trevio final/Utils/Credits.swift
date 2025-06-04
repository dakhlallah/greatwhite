//
//  Credits.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//

import SwiftUI

struct CreditTabBarView: View {
    @Binding var selectedTab: Int
    let tabBarItems: [String]

    var body: some View {
        HStack {
            ForEach(0..<tabBarItems.count, id: \.self) { index in
                CreditTabBarItem(title: tabBarItems[index], isSelected: selectedTab == index)
                    .onTapGesture {
                        selectedTab = index
                    }
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground).shadow(radius: 2))
    }
}

struct CreditTabBarItem: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .fontWeight(isSelected ? .bold : .regular)
            .foregroundColor(isSelected ? .blue : .gray)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
            .cornerRadius(10)
    }
}

struct CreditView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Credit Balance
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your trevio credits")
                        .font(.system(size: 22, weight: .bold))

                    VStack(alignment: .leading, spacing: 8) {
                        Text("USD 0.00")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("You can use your Trevio credits at checkout to get a discount.")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Button("Buy data plan") {}
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black)
                            )
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                }

                // Referral Bonus
                VStack(alignment: .leading, spacing: 12) {
                    Text("USD 5 for both you and your friend")
                        .font(.headline)
                        .fontWeight(.semibold)

                    Text("Share your referral code with friends — they will get USD 5 off the first purchase, you’ll receive USD 5 in Trevio credit. It’s a win–win!")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Referral code")
                            .font(.caption)
                            .foregroundColor(.gray)

                        HStack {
                            Text("DAKHLA6937")
                                .font(.body)
                                .fontWeight(.medium)

                            Spacer()

                            Button(action: {}) {
                                Image(systemName: "doc.on.doc")
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    }

                    Button(action: {}) {
                        Text("Share code")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)

                // How it works
                VStack(alignment: .leading, spacing: 16) {
                    Text("How it works?")
                        .font(.headline)

                    VStack(alignment: .leading, spacing: 12) {
                        Label("Invite friends", systemImage: "person.crop.circle.fill.badge.plus")
                        Label("Wait for purchase", systemImage: "clock")
                        Label("Get instant rewards", systemImage: "gift")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }

                // Redeem Voucher
                VStack(alignment: .leading, spacing: 16) {
                    Text("Redeem a Trevio voucher")
                        .font(.headline)

                    Text("Enter a voucher code and get your reward immediately.")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    TextField("Enter a voucher code", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {}) {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)

                // Credit History
                VStack(alignment: .leading, spacing: 8) {
                    Text("Credits history")
                        .font(.headline)

                    Text("No history yet.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CreditView()
}
