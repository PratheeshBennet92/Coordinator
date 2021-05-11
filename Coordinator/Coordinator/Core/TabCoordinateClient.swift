import Foundation
//Framework
protocol TabCoordinateClient {
  var coordinator: TabCoordinatorDecorator! {get set}
  func setRoot()
  init()
}
extension TabCoordinateClient {
  init(coordinator: TabCoordinatorDecorator) {
    self.init()
    self.coordinator = coordinator
  }
}
