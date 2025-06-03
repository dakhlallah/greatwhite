import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.items) { item in
                Text(item.title)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Logout") {
                        authViewModel.logout()
                    }
                }
            }
            .task {
                await viewModel.fetchItems()
            }
        }
    }
}
