//
//  AppDelegate.swift
//  CoordinatorSampleApp
//
//  Created by Pratheesh on 5/12/21.
//

import UIKit
import Coordinator
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window:UIWindow?
  var tabCoordinator: TabCoordinator?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    if let appwindow = self.window {
      tabCoordinator = TabCoordinator(coordinator: TabCoordinatorDecorator(window: appwindow))
      tabCoordinator?.setRoot()
      tabCoordinator?.setUpChildCoordinators()
    }
    // Override point for customization after application launch.
    return true
  }
}

