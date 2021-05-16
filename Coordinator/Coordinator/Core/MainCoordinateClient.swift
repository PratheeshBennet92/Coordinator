import Foundation
public protocol MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator! {get set}
  func setRoot()
  init()
}
extension MainCoordinateClient {
  public init(mainCoordinator: MainCoordinatorDecorator) {
    self.init()
    self.coordinator = mainCoordinator
  }
}
