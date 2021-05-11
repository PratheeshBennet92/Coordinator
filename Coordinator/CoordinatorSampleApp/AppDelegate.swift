//
//  AppDelegate.swift
//  CoordinatorSampleApp
//
//  Created by Pratheesh on 5/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window:UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let controller = UIViewController()
    controller.view.backgroundColor = .yellow
    window?.rootViewController = controller
    window?.makeKeyAndVisible()
    // Override point for customization after application launch.
    return true
  }
}

