import Foundation
import UIKit
/**
  NavigateDecorator holds all the default function definitions wrapped from the coordinator protocol and base coordinator protocol and acts on the generic view controller
 */
class NavigateDecorator<T: UIViewController>: Coordinator {
  var hubViewController: T
  typealias View = T
  var presenter: UINavigationController
  required init(_ presenter: UINavigationController) {
    self.presenter = presenter
    self.hubViewController = T()
  }
  func push() {
    self.presenter.pushViewController(hubViewController, animated: true)
  }
  func present() {
    self.presenter.present(hubViewController, animated: true, completion: nil)
  }
  func setRoot() {
    self.presenter.setViewControllers([hubViewController], animated: true)
  }
  func dismiss() {
    hubViewController.dismiss(animated: true, completion: nil)
  }
}
