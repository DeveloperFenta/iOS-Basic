//
//  AppDelegate.swift
//  SubmitValue-Repository
//
//  Created by Fenta on 2020/10/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // App Data
    var email: String?
    var isUpdate: Bool?
    var interval: Double?
    var settingDate: Date?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let userDefaults = UserDefaults.standard
        
        if let email = userDefaults.string(forKey: "email") {
            self.email = email
        }
        isUpdate = userDefaults.bool(forKey: "isUpdate")
        interval = userDefaults.double(forKey: "interval")
        if let settingDate = userDefaults.object(forKey: "settingDate") as? Date {
            self.settingDate = settingDate
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

