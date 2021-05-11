import Foundation
import UIKit
protocol TabbarCoordinatable {
  var rootViewController: UITabBarController { get set }
  var childCoordinators: [MainCoordinateClient]? { get set }
  init(window: UIWindow)
  func start()
}
