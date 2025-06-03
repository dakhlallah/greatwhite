import Foundation
import FirebaseFirestore

@MainActor
class HomeViewModel: ObservableObject {
    @Published var items: [ContentModel] = []
    private var db = Firestore.firestore()

    func fetchItems() async {
        do {
            let snapshot = try await db.collection("items").getDocuments()
            self.items = snapshot.documents.compactMap { doc in
                try? doc.data(as: ContentModel.self)
            }
        } catch {
            print("Fetch items error: \(error.localizedDescription)")
        }
    }
}
