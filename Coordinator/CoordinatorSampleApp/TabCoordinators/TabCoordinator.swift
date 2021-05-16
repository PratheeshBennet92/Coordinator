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
    setupTabTwoJourney()
    setupTabViews()
  }
  func setupTabViews() {
    var views: [UINavigationController] = []
    coordinator.childCoordinators?.forEach({ (eachCoordinate) in
      views.append(eachCoordinate.coordinator.navigationController)
    })
    coordinator.rootViewController.viewControllers = views
    coordinator.rootViewController.viewControllers?[0].title = "Tab one"
    coordinator.rootViewController.viewControllers?[1].title = "Tab two" 
  }
  private func setupTabOneJourney() {
    let tabOneCoordinator = TabOneCoordinator(mainCoordinator: MainCoordinatorDecorator())
    tabOneCoordinator.setRoot()
    coordinator.childCoordinators?.append(tabOneCoordinator)
  }
  private func setupTabTwoJourney() {
    let tabTwoCoordinator = TabTwoCoordinator(mainCoordinator: MainCoordinatorDecorator())
    tabTwoCoordinator.setRoot()
    coordinator.childCoordinators?.append(tabTwoCoordinator)
  }
}
