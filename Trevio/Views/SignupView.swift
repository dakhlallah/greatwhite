import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Sign Up") {
                Task {
                    await authViewModel.signup(email: email, password: password)
                }
            }
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}
