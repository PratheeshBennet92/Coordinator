import Foundation
import UIKit
/// TabCoordinatorDecorator delclares the UITabBarController and manages the child maincoordinators
public class TabCoordinatorDecorator: TabbarCoordinatable {
  public var childCoordinators: [MainCoordinateClient]?
  public var rootViewController: UITabBarController
  var window: UIWindow
  /// - Parameters: MainCoordinatorDecorator
  public required init(window: UIWindow) {
    self.rootViewController = UITabBarController()
    self.rootViewController.setupAppearance()
    self.window = window
    start()
  }
  ///Sets the UITabBarController as the root of the app window
  public func setRoot() {
    self.window.rootViewController = self.rootViewController
    self.window.makeKeyAndVisible()
  }
  public func start() {
    self.childCoordinators = []
  }
}
