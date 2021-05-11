import Foundation
import UIKit
// Framework
protocol BaseCoordinator: AnyObject {
  var presenter: UINavigationController { get set }
  init(_ presenter: UINavigationController)
}
