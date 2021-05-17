import Foundation
/// Maincoordinators has to conform to MainCoordinateClient
public protocol MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator! {get set}
  /// Set the root view of the view coordinator
  func setRoot()
  init()
}
extension MainCoordinateClient {
  public init(mainCoordinator: MainCoordinatorDecorator) {
    self.init()
    self.coordinator = mainCoordinator
  }
}
