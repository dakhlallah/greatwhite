import SwiftUI

// MARK: - Rounded Bar Chart Component
struct RoundedBarChart: View {
    let data: [Int]
    let maxValue: Int

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(data.indices, id: \.self) { index in
                Capsule()
                    .fill(index == data.count - 1 ? Color.blue.opacity(0.4) : Color.black)
                    .frame(width: 12, height: CGFloat(data[index]) / CGFloat(maxValue) * 180)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: data)
    }
}

// MARK: - Trevio eSIM Data Dashboard
struct TrevioDataDashboardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header and Data Overview
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Welcome, Alaa")
                            .font(.title3)
                            .bold()
                        Spacer()
                        HStack(spacing: 16) {
                            Image(systemName: "bell")
                            Image(systemName: "person.circle")
                        }
                        .font(.title3)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Your data balance")
                            .foregroundColor(.gray)
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            Text("120.6")
                                .font(.system(size: 40, weight: .semibold, design: .default))
                            Text("GB")
                                .font(.headline)
                        }
                    }

                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                    }

                    // Bar Chart
                    RoundedBarChart(data: [4, 4, 5, 6, 5, 6, 8, 7, 10, 9, 11, 12, 10], maxValue: 12)
                        .frame(height: 140)

                    HStack {
                        Text("Jan 2024")
                        Spacer()
                        Text("Monthly")
                            .font(.subheadline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.white)
                            .clipShape(Capsule())
                        Spacer()
                        Text("Jan 2025")
                    }
                    .font(.caption)
                    .foregroundColor(.black)
                }
                .padding()
                .background(Color(red: 0.56, green: 0.77, blue: 0.94))
                .foregroundColor(.black)

                // Lower Call-to-Action Card
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Data Plans")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }

                    Text("Top up your eSIM anytime and stay connected in France – 2.5 GB remaining.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .padding()
            }
        }
        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
    }
}

#if DEBUG
struct TrevioDataDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        TrevioDataDashboardView()
    }
}
#endif
