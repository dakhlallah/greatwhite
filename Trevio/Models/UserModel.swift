import Foundation
import FirebaseFirestoreSwift

struct UserModel: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var email: String
}
