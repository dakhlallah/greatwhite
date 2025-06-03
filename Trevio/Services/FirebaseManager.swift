import Foundation
import Firebase

final class FirebaseManager {
    static let shared = FirebaseManager()
    let auth: Auth
    let firestore: Firestore

    private init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
    }
}
