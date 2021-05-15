import Foundation
import Coordinator
class TabCoordinator: TabCoordinateClient {
  var coordinator: TabCoordinatorDecorator!
  required init() {}
  func setRoot() {
    self.coordinator.setRoot()
  }
  func setUpChildCoordinators() {
    
  }
}
