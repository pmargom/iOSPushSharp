//
//  AppDelegate.swift
//  PushTuto
//
//  Created by Pedro Martin Gomez on 19/8/17.
//  Copyright © 2017 Ligarto Labs. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
        //let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
//        let settings = UIUserNotificationSettings(types: .alert, categories: nil)
//        
//        application.registerUserNotificationSettings(settings)
//        application.registerForRemoteNotifications()
        // iOS 10 support
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            application.registerForRemoteNotifications()
        }
        // iOS 9 support
//        else if #available(iOS 9, *) {
//            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
//            UIApplication.shared.registerForRemoteNotifications()
//        }
//        // iOS 8 support
//        else if #available(iOS 8, *) {
//            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
//            UIApplication.shared.registerForRemoteNotifications()
//        }
        // iOS 7 support
        else {  
            application.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
        }
        
        return true
    }
    
    // Called when APNs has assigned the device a unique token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        
        // Print it to console
        print("APNs device token: \(deviceTokenString)")
        
        // Persist it in your backend in case it's new
    }
    
    // Called when APNs failed to register the device for push notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // Print the error to console (you should alert the user that registration failed)
        print("APNs registration failed: \(error)")
    }
    
    // Push notification received
    func application(_ application: UIApplication, didReceiveRemoteNotification data: [AnyHashable : Any]) {
        // Print notification payload data
        print("Push notification received: \(data)")
    }




}

