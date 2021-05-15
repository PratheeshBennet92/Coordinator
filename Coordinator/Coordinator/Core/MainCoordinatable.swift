import Foundation
import UIKit
/*class protocol https:www.bignerdranch.com/blog/protocol-oriented-problems-and-the-immutable-self-error/
 */
//Framework
public protocol MainCoordinatable: AnyObject {
  var navigationController: UINavigationController { get set }
  //We use an array of childCoordinators to prevent the child coordinators from getting deallocated.
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
  public func getCoordinator<T>(type: T.Type) -> T? {
    //The point of generics is to operate on arguments generically, but you aren't giving the function any argument of a specific type to actually do any work on (hence the inability to infer one).
    let coordinator = self.childCoordinators?.filter({ (eachCoordinator) -> Bool in
      eachCoordinator is T
    })
    return coordinator?.first as? T
  }
  /// Remove a child coordinator from the parent
  public func removeChildCoordinator<T>(type: T.Type) {
    self.childCoordinators = self.childCoordinators?.filter({ (eachCoordinator) -> Bool in
      !(eachCoordinator is T)
    })
  }
}
