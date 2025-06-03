import Foundation
import Firebase

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    private var auth = Auth.auth()

    init() {
        self.isAuthenticated = auth.currentUser != nil
    }

    func login(email: String, password: String) async {
        do {
            let _ = try await auth.signIn(withEmail: email, password: password)
            self.isAuthenticated = true
        } catch {
            print("Login error: \(error.localizedDescription)")
        }
    }

    func signup(email: String, password: String) async {
        do {
            let _ = try await auth.createUser(withEmail: email, password: password)
            self.isAuthenticated = true
        } catch {
            print("Signup error: \(error.localizedDescription)")
        }
    }

    func logout() {
        do {
            try auth.signOut()
            self.isAuthenticated = false
        } catch {
            print("Logout error: \(error.localizedDescription)")
        }
    }
}
