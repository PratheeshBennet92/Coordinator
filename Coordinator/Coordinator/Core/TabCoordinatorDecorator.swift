import Foundation
import UIKit
public class TabCoordinatorDecorator: TabbarCoordinatable {
  public var childCoordinators: [MainCoordinateClient]?
  public var rootViewController: UITabBarController
  var window: UIWindow
  public required init(window: UIWindow) {
    self.rootViewController = UITabBarController()
    self.window = window
    start()
  }
  public func setRoot() {
    self.window.rootViewController = self.rootViewController
    self.window.makeKeyAndVisible()
  }
  public func start() {
    self.childCoordinators = []
  }
}
