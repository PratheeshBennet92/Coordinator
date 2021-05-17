import Foundation
import UIKit
public protocol MainCoordinatable: AnyObject {
  var navigationController: UINavigationController { get set }
  ///We use an array of childCoordinators to prevent the child coordinators from getting deallocated.
  var childCoordinators: [CoordinatorClient]? { get set }
  init()
  func start()
}
extension MainCoordinatable {
  /// Add a child coordinator to the parent
  public func addChildCoordinator(_ childCoordinator: CoordinatorClient) {
    self.childCoordinators?.append(childCoordinator)
  }
  public func removeChildCoordinator(_ childCoordinator: CoordinatorClient?) {
    guard let safeaArrayCoordinators = self.childCoordinators,
      let coordinatorToRemove = childCoordinator else { return
    }
    for (index, value ) in safeaArrayCoordinators.enumerated() where value === coordinatorToRemove {
        self.childCoordinators?.remove(at: index)
    }
  }
}
