import Foundation
import UIKit
//Framework
public protocol CoordinateableView {
  var coordinator: CoordinatorClient? {get set}
  associatedtype CoordinatorDelegate
  var coordinatorDelegate: CoordinatorDelegate? { get set }
}
public class ViewCoordinator<T: UIViewController>: CoordinatorClient where T: CoordinateableView {
  private let decorator: NavigateDecorator<T>
  var view: T? {
    return decorator.hubViewController
  }
  var presenter: UINavigationController
  public required init(_ presenter: UINavigationController, delegate: MainCoordinateClient? = nil) {
    self.presenter = presenter
    decorator = NavigateDecorator<T>(presenter)
    decorator.hubViewController.coordinator = self
    decorator.hubViewController.coordinatorDelegate = delegate as? T.CoordinatorDelegate
  }
  public func push() {
    decorator.push()
  }
  public func present() {
    decorator.present()
  }
  public func setRoot() {
    decorator.setRoot()
  }
  public func dismiss() {
    decorator.dismiss()
  }
}
