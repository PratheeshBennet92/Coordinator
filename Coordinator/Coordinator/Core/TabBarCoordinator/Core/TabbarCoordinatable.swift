import Foundation
import UIKit
/// TabbarCoordinatable delclares the UITabBarController and manages the child maincoordinators
public protocol TabbarCoordinatable {
  var rootViewController: UITabBarController { get set }
  var childCoordinators: [MainCoordinateClient]? { get set }
  /// - Parameters: MainCoordinatorDecorator
  init(window: UIWindow)
  func start()
  ///Sets the UITabBarController as the root of the app window
  func setRoot()
}
