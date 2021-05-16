import Foundation
//Framework
public protocol TabCoordinateClient {
  var coordinator: TabCoordinatorDecorator! {get set}
  /// Use this method to set the UITabvViewController as rootViewController of the window
  func setRoot()
  /// Use this method to set and configure the coordinators associated with each tab of the UITabvViewController
  func setUpChildCoordinators()
  /// Use this method to setup and configure the tabview properties like title, icons
  /// coordinator.rootViewController.viewControllers will give the array of view controllers associated
  func setupTabViews()
  init()
}
extension TabCoordinateClient {
  /// Inject instance of TabCoordinatorDecorator
  public init(coordinator: TabCoordinatorDecorator) {
    self.init()
    self.coordinator = coordinator
  }
}
