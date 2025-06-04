import SwiftUI
import SwiftUI

// Placeholder ViewModel and Model Definitions
class NotificationsViewModel: ObservableObject {
    @Published var notifications: [Notification] = []
}

struct Notification: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let message: String
    let timeAgo: String
    let type: NotificationType
}

enum NotificationType {
    case info, warning, success, error

    var color: Color {
        switch self {
        case .info: return .blue
        case .warning: return .yellow
        case .success: return .green
        case .error: return .red
        }
    }
}

struct NotificationsCenterView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NotificationsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            headerView
            
            if viewModel.notifications.isEmpty {
                // Empty State
                emptyStateView
            } else {
                // Notifications List
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.notifications) { notification in
                            NotificationRow(notification: notification)
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private var headerView: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Text("NOTIFICATIONS")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .shadow(color: .gray.opacity(0.2), radius: 5, y: 5)
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text("No Notifications")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("We'll let you know when there will be something\nto update you.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
    }
}

struct NotificationRow: View {
    let notification: Notification
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                // Notification Icon
                Image(systemName: notification.icon)
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .background(notification.type.color)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(notification.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text(notification.message)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text(notification.timeAgo)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Divider()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

#Preview {
    NotificationsCenterView()
}
