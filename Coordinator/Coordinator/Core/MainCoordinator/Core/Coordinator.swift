import Foundation
import UIKit
protocol Coordinator: BaseCoordinator & CoordinatorClient {
  associatedtype View
  var hubViewController: View { get set }
}
