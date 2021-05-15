import Foundation
import UIKit
//Framework
public class MainCoordinatorDecorator: MainCoordinatable {
  var childCoordinators: [CoordinatorClient]?
  var navigationController: UINavigationController
  required init() {
    self.navigationController = UINavigationController()
    start()
  }
  func start() {
    self.childCoordinators = []
  }
}
