import Foundation
import UIKit
//Framework
protocol Coordinator: BaseCoordinator & CoordinatorClient {
  associatedtype View
  var hubViewController: View { get set }
}
