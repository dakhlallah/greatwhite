import SwiftUI

struct Plan: Identifiable {
    let id = UUID()
    let description: String
    let price: String
}

struct CountryDetailsScreen: View {
    let countryName: String
    let plans: [Plan]

    init(countryName: String = "France", plans: [Plan] = [
        Plan(description: "1 GB / 7 days", price: "$3.99"),
        Plan(description: "5 GB / 15 days", price: "$9.99"),
        Plan(description: "10 GB / 30 days", price: "$18.99")
    ]) {
        self.countryName = countryName
        self.plans = plans
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(countryName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Text("Available eSIM Plans")
                .font(.title3)
                .foregroundColor(.gray)

            ForEach(plans) { plan in
                HStack {
                    VStack(alignment: .leading) {
                        Text(plan.description)
                            .font(.headline)
                        Text(plan.price)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button(action: {
                        // TODO: Implement purchase action
                    }) {
                        Text("Buy")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("eSIM for \(countryName)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CountryDetailsScreen()
}
