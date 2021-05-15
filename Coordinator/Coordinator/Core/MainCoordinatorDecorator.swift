import Foundation
import UIKit
//Framework
public class MainCoordinatorDecorator: MainCoordinatable {
  public var childCoordinators: [CoordinatorClient]?
  public var navigationController: UINavigationController
  required public init() {
    self.navigationController = UINavigationController()
    start()
  }
  public func start() {
    self.childCoordinators = []
  }
}
