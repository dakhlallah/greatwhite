import Foundation
import UserNotifications
import FirebaseMessaging

class NotificationManager: NSObject, UNUserNotificationCenterDelegate, MessagingDelegate {
    static let shared = NotificationManager()

    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        Messaging.messaging().delegate = self
    }

    func unregisterForPushNotifications() {
        UIApplication.shared.unregisterForRemoteNotifications()
    }
}
