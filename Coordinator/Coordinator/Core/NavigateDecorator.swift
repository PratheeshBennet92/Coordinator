import Foundation
import UIKit
//Framework
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
    hubViewController.modalPresentationStyle = .overFullScreen
    self.presenter.present(hubViewController, animated: true, completion: nil)
  }
  func setRoot() {
    self.presenter.setViewControllers([hubViewController], animated: true)
  }
  func dismiss() {
    hubViewController.dismiss(animated: true, completion: nil)
  }
}
