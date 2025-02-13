//
//  AppDelegate.swift
//  MovieSwift
//
//  Created by Akshat Goyal on 11/02/25.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import UIKit
import AdsFramework
import AppTrackingTransparency


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let objAdster = AdsterProvider()
    
    // MARK: -
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AdSter.sharedInstance().start(completionHandler: { status in
            print("Ad initialized \(String(describing: status))")
        })
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

let APP_DELEGATE = UIApplication.shared.delegate as? AppDelegate
