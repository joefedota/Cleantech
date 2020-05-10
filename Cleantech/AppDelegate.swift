//
//  AppDelegate.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/15/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var stateController = StateController(route: "dummy")
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*guard let tabBarController = window?.rootViewController as? UITabBarController,
            let viewControllers = tabBarController.viewControllers else {
                return true
        }
        for (index, viewController) in viewControllers.enumerated(){
            if let viewCon = viewController as? ViewController {
                viewCon.stateController = self.stateController
            }
            if let routeCon = viewController as? RoutingViewController {
                routeCon.stateController = self.stateController
            }
        }*/
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

