import Foundation
import UIKit
//Framework
public class TabCoordinatorDecorator: TabbarCoordinatable {
  var childCoordinators: [MainCoordinateClient]?
  var rootViewController: UITabBarController
  var window: UIWindow
  required init(window: UIWindow) {
    self.rootViewController = UITabBarController()
    self.window = window
    start()
  }
  func setRoot() {
    self.window.rootViewController = self.rootViewController
  }
  func start() {
    self.childCoordinators = []
  }
}
