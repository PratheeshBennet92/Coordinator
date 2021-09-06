import Foundation
import UIKit
/**
  NavigateDecorator holds all the default function definitions wrapped from the coordinator protocol and base coordinator protocol and acts on the generic view controller
 */
public class NavigateDecorator<T: UIViewController>: Coordinator {
  public var hubViewController: T
  typealias View = T
  var presenter: UINavigationController
  required init(_ presenter: UINavigationController) {
    self.presenter = presenter
    self.hubViewController = T()
  }
  public func push() {
    self.presenter.pushViewController(hubViewController, animated: true)
  }
  public func pop() {
    self.presenter.popViewController(animated: true)
  }
  public func present() {
    self.presenter.present(hubViewController, animated: true, completion: nil)
  }
  public func setRoot() {
    self.presenter.setViewControllers([hubViewController], animated: true)
  }
  public func dismiss() {
    hubViewController.dismiss(animated: true, completion: nil)
  }
}
