import Foundation
import UIKit
public class MainCoordinatorDecorator: MainCoordinatable {
  public var childCoordinators: [CoordinatorClient]?
  public var navigationController: UINavigationController
  required public init() {
    self.navigationController = UINavigationController()
    self.navigationController.navigationBar.isHidden = false
    start()
  }
  public func start() {
    self.childCoordinators = []
  }
}
