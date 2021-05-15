import Foundation
//Framework
public protocol MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator! {get set}
  func setRoot()
  init()
}
extension MainCoordinateClient {
  init(mainCoordinator: MainCoordinatorDecorator) {
    self.init()
    self.coordinator = mainCoordinator
  }
}
