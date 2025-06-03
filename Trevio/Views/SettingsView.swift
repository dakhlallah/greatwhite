import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var notificationsEnabled: Bool = true

    var body: some View {
        Form {
            Toggle("Dark Mode", isOn: $isDarkMode)
            Toggle("Push Notifications", isOn: $notificationsEnabled)
                .onChange(of: notificationsEnabled) { value in
                    if value {
                        NotificationManager.shared.registerForPushNotifications()
                    } else {
                        NotificationManager.shared.unregisterForPushNotifications()
                    }
                }
        }
        .navigationTitle("Settings")
    }
}
