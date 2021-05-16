import Foundation
import UIKit
import Coordinator
class TabCoordinator: TabCoordinateClient {
  var coordinator: TabCoordinatorDecorator!
  required init() {}
  func setRoot() {
    self.coordinator.setRoot()
  }
  func setUpChildCoordinators() {
    setupTabOneJourney()
    setupTabViews()
  }
  func setupTabViews() {
    var views: [UINavigationController] = []
    coordinator.childCoordinators?.forEach({ (eachCoordinate) in
      views.append(eachCoordinate.coordinator.navigationController)
    })
    coordinator.rootViewController.viewControllers = views
  }
  private func setupTabOneJourney() {
    let tabOneCoordinator = TabOneCoordinator(mainCoordinator: MainCoordinatorDecorator())
    tabOneCoordinator.setRoot()
    coordinator.childCoordinators?.append(tabOneCoordinator)
  }
}
