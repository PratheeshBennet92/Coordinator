import Foundation
import UIKit
protocol BaseCoordinator: AnyObject {
  var presenter: UINavigationController { get set }
  init(_ presenter: UINavigationController)
}
