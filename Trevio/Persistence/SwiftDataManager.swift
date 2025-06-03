import Foundation
import SwiftData

class SwiftDataManager {
    static let shared = SwiftDataManager()
    let container: ModelContainer

    private init() {
        container = try! ModelContainer(for: LocalItem.self)
    }
}

@Model
class LocalItem {
    var id: UUID
    var value: String

    init(id: UUID = UUID(), value: String) {
        self.id = id
        self.value = value
    }
}
