import Foundation
import FirebaseFirestore
import FirebaseAuth

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: UserModel = UserModel(id: "", name: "", email: "")
    private var db = Firestore.firestore()

    func loadProfile() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            if let document = try await db.collection("users").document(uid).getDocument(),
               let profile = try? document.data(as: UserModel.self) {
                self.user = profile
            }
        } catch {
            print("Load profile error: \(error.localizedDescription)")
        }
    }

    func saveProfile() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            try db.collection("users").document(uid).setData(from: user)
        } catch {
            print("Save profile error: \(error.localizedDescription)")
        }
    }
}
