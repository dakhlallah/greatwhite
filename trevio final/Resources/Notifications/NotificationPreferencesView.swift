import SwiftUI

struct NotificationPreferencesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var specialOffers = true
    @State private var promos = true
    @State private var tripUpdates = true
    @State private var suggestions = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Navigation bar
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Push notifications")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    VStack(spacing: 24) {
                        NotificationToggle(title: "Special offers", isOn: $specialOffers)
                        NotificationToggle(title: "Promos", isOn: $promos)
                        NotificationToggle(title: "Trip updates", isOn: $tripUpdates)
                        NotificationToggle(title: "Personalized suggestions", isOn: $suggestions)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
        .background(Color(.systemBackground))
    }
}

struct NotificationToggle: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(title)
                .font(.system(size: 17))
        }
        .tint(.black)
    }
}
