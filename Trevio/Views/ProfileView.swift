import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("Name", text: $viewModel.user.name)
                TextField("Email", text: $viewModel.user.email)
            }
            Button("Save") {
                Task {
                    await viewModel.saveProfile()
                }
            }
        }
        .navigationTitle("Profile")
        .task {
            await viewModel.loadProfile()
        }
    }
}
