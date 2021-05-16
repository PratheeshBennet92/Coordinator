import Foundation
import Coordinator
class TabTwoCoordinator: MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator!
  required init() {}
  func setRoot() {
    showFirstViewController()
  }
  private func showFirstViewController() {
    let tabOneViewOneCoordinator = ViewCoordinator<Tab2ViewController1>(self.coordinator.navigationController, delegate: self)
    tabOneViewOneCoordinator.setRoot()
    self.coordinator.addChildCoordinator(tabOneViewOneCoordinator)
  }
}
extension TabTwoCoordinator: Tab2ViewController1CoordinatorDelegate {
  func push(_ coordinator: CoordinatorClient?) {
    let tabOneViewOneCoordinator = ViewCoordinator<Tab2ViewController2>(self.coordinator.navigationController, delegate: self)
    tabOneViewOneCoordinator.push()
    self.coordinator.addChildCoordinator(tabOneViewOneCoordinator)
  }
}
extension TabTwoCoordinator: Tab2ViewController2CoordinatorDelegate {
  func pop(_ coordinator: CoordinatorClient?) {
    self.coordinator.removeChildCoordinator(coordinator)
  }
}
