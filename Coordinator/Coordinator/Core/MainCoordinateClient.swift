import Foundation
//Framework
public protocol MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator! {get set}
  func setRoot()
  init(mainCoordinator: MainCoordinatorDecorator)
}
