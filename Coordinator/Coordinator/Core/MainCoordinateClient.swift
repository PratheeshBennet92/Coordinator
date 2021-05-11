import Foundation
//Framework
protocol MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator! {get set}
  func setRoot()
  init(mainCoordinator: MainCoordinatorDecorator)
}
