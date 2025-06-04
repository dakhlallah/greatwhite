import SwiftUI

struct NotificationsView: View {
    @State private var pushNotifications = true
    @State private var emailNotifications = true
    @State private var jobUpdates = true
    @State private var workerStatus = true
    @State private var dailySummary = false
    @State private var weeklyReport = true
    @State private var promotionalEmails = false
    
    var body: some View {
        List {
            Section {
                Toggle("Push Notifications", isOn: $pushNotifications)
                Toggle("Email Notifications", isOn: $emailNotifications)
                Toggle("Job Updates", isOn: $jobUpdates)
                Toggle("Worker Status", isOn: $workerStatus)
            }
            
            Section("Email Preferences") {
                Toggle("Daily Summary", isOn: $dailySummary)
                Toggle("Weekly Report", isOn: $weeklyReport)
                Toggle("Promotional Emails", isOn: $promotionalEmails)
            }
        }
        .navigationTitle("Notifications")
    }
}
