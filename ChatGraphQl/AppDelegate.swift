//
//  AppDelegate.swift
//  ChatGraphQl
//
//  Created by Azizbek Salimov on 30.05.2022.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       window = UIWindow()
        let vc = RegisterVC()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        registerForPushNotifications()
        return true
    }
    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      print("🇷🇺Device Token: \(token)")
    }
    
    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
      print("Failed to register: \(error)")
    }
    
    func application(
      _ application: UIApplication,
      didReceiveRemoteNotification userInfo: [AnyHashable: Any],
      fetchCompletionHandler completionHandler:
      @escaping (UIBackgroundFetchResult) -> Void
    ) {
      guard let aps = userInfo["aps"] as? [String: AnyObject] else {
        completionHandler(.failed)
        return
      }
      
//      if aps["content-available"] as? Int == 1 {
//        let podcastStore = PodcastStore.sharedStore
//        podcastStore.refreshItems { didLoadNewItems in
//          completionHandler(didLoadNewItems ? .newData : .noData)
//        }
//      }
    }

    func registerForPushNotifications() {
      UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
          guard let self = self else { return }
          print("Permission granted: \(granted)")
          
          guard granted else { return }
          
//          let viewAction = UNNotificationAction(
//            identifier: Identifiers.viewAction, title: "View",
//            options: [.foreground])
//
//          let newsCategory = UNNotificationCategory(
//            identifier: Identifiers.newsCategory, actions: [viewAction],
//            intentIdentifiers: [], options: [])
          
//          UNUserNotificationCenter.current()
//            .setNotificationCategories([newsCategory])
          
          self.getNotificationSettings()
      }
    }
    
    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
    }

}

