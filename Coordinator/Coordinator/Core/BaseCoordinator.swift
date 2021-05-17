import Foundation
import UIKit
///BaseCoordinator contains the UINavigationController associated with the particular coordinator
protocol BaseCoordinator: AnyObject {
  var presenter: UINavigationController { get set }
  init(_ presenter: UINavigationController)
}
