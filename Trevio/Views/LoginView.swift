import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Login") {
                    Task {
                        await authViewModel.login(email: email, password: password)
                    }
                }
                NavigationLink("Don't have an account? Sign Up", destination: SignupView())
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}
