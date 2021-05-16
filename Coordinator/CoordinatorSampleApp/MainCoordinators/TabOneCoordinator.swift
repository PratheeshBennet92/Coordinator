import Foundation
import Coordinator
class TabOneCoordinator: MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator!
  required init() {}
  func setRoot() {
    showFirstViewController()
  }
  private func showFirstViewController() {
    let tabOneViewOneCoordinator = ViewCoordinator<Tab1ViewController1>(self.coordinator.navigationController, delegate: self)
    tabOneViewOneCoordinator.setRoot()
    self.coordinator.addChildCoordinator(tabOneViewOneCoordinator)
  }
}
