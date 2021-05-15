import Foundation
import Coordinator
class TabOneCoordinator: MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator!
  required init() {}
  func setRoot() {
    showSFirstViewController()
  }
  private func showSFirstViewController() {
    let scheduleCoordinator = ViewCoordinator<Tab1ViewController1>(self.coordinator.navigationController, delegate: self)
    scheduleCoordinator.setRoot()
    self.coordinator.addChildCoordinator(scheduleCoordinator)
  }
}
