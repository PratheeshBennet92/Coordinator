import Foundation
//Framework
public protocol TabCoordinateClient {
  var coordinator: TabCoordinatorDecorator! {get set}
  func setRoot()
  func setUpChildCoordinators()
  init()
}
extension TabCoordinateClient {
  init(coordinator: TabCoordinatorDecorator) {
    self.init()
    self.coordinator = coordinator
  }
}
