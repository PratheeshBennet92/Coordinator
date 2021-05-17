import Foundation
import UIKit
/** ViewCoordinator serves as the child coordinator for each associated view. It performs navigation mechanisms like pushing view, presenting view, setting root view and dismissing view
    - T represents the view controller associated with the coordinator
    - NavigateDecorator holds all the default function definitions wrapped from the coordinator protocol and base coordinator protocol and acts on the generic view controller
    - The child coordinators manages the navigations and presentations where as main coordinator manages the child coordinators
 */
public class ViewCoordinator<T: UIViewController>: CoordinatorClient where T: CoordinateableView {
  private let decorator: NavigateDecorator<T>
  var view: T? {
    return decorator.hubViewController
  }
  var presenter: UINavigationController
  public required init(_ presenter: UINavigationController, delegate: MainCoordinateClient? = nil, presentationStyle: UIModalPresentationStyle = .overFullScreen ) {
    self.presenter = presenter
    decorator = NavigateDecorator<T>(presenter)
    decorator.hubViewController.modalPresentationStyle = presentationStyle
    decorator.hubViewController.coordinator = self
    decorator.hubViewController.coordinatorDelegate = delegate as? T.CoordinatorDelegate
  }
  /// Push viewcontroller on the navigation controller
  public func push() {
    decorator.push()
  }
  /// Push viewcontroller over the navigation controller
  public func present() {
    decorator.present()
  }
  /// Set root view controller on navigation controller
  public func setRoot() {
    decorator.setRoot()
  }
  /// Dismiss presented view controller
  public func dismiss() {
    decorator.dismiss()
  }
}
