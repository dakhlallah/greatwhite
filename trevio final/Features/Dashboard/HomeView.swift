import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            eSims()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("eSIMs")
                }

            CreditView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Credits")
                }

            Help()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Help")
                }

            Profile()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}
import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedTag = "All"
    @State private var hasInternetConnection = true
    @State private var isCheckingConnection = false

    func checkInternetConnection() {
        isCheckingConnection = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Simulated random connection result
            hasInternetConnection = Bool.random()
            isCheckingConnection = false
        }
    }
    
    let tags = ["All", "France", "Dubai", "Turkey", "Lebanon"]
    let plans = [
        ("France", "Paris", "1GB Valid for 7 days", "$12", "eiffeltower"),
        ("UAE", "Dubai", "3GB Valid for 15 days", "$18", "burjkhalifa"),
        ("Turkey", "Istanbul", "2GB Valid for 10 days", "$14", "istanbul")
    ]

    var body: some View {
        NavigationStack {
            if hasInternetConnection {
                VStack(alignment: .leading, spacing: 20) {

                // Header
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        Text("Hey Alaa")
                            .font(.headline)
                        Text("Welcome to Paris")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "bell.badge")
                        .font(.title2)
                }

                // Search
                HStack {
                    TextField("Where to next?", text: $searchText)
                        .padding(12)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }

                // Tags
                VStack(alignment: .leading, spacing: 10) {
                    Text("Trending Destinations")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(tags, id: \.self) { tag in
                                Text(tag)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedTag == tag ? Color.black : Color(.systemGray5))
                                    .foregroundColor(selectedTag == tag ? .white : .black)
                                    .cornerRadius(20)
                                    .onTapGesture { selectedTag = tag }
                            }
                        }
                    }
                }

                // Headline
                VStack(alignment: .leading, spacing: 4) {
                    Text("GLOBAL CONNECTIVITY")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\"UNLOCK THE WORLD\"")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("With Trevio")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                // Card Carousel (sample static image)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            ZStack(alignment: .topTrailing) {
                                Image("image paris")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 320, height: 220)
                                    .clipped()
                                    .cornerRadius(24)
                                    .overlay(
                                        VStack(alignment: .leading, spacing: 6) {
                                            Spacer()
                                            Text("1GB Valid for 7 days")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Text("Buy for $12")
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                            Text("🇫🇷 France · Paris")
                                                .font(.caption)
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    )

                                HStack(spacing: 8) {
                                    Button(action: {}) {
                                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                                            .padding(8)
                                            .background(.ultraThinMaterial)
                                            .clipShape(Circle())
                                    }
                                    Button(action: {}) {
                                        Text("Buy data plan")
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(.ultraThinMaterial)
                                            .clipShape(Capsule())
                                    }
                                    Button(action: {}) {
                                        Image(systemName: "heart")
                                            .padding(8)
                                            .background(.ultraThinMaterial)
                                            .clipShape(Circle())
                                    }
                                }
                                .padding()
                            }
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                            .animation(.spring().delay(Double(index) * 0.15), value: index)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
                }
                .padding()
                .navigationTitle("")
                .onAppear { checkInternetConnection() }
            } else {
                VStack(spacing: 24) {
                    Spacer()
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "exclamationmark")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                        )

                    Text("No internet connection")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text("Some features may be unavailable.")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("You need to be online to access the app. But you can still check the instructions on how to use your eSIM.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .padding(.horizontal)

                    Button("Retry") {
                        checkInternetConnection()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(24)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
