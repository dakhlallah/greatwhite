import Foundation
import FirebaseFirestoreSwift

struct ContentModel: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var detail: String
}
