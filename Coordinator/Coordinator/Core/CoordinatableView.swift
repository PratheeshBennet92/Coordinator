import Foundation
/**
 UIViewController conforms to the CoordinateableView protocol
*/
public protocol CoordinateableView {
  var coordinator: CoordinatorClient? {get set}
  associatedtype CoordinatorDelegate
  var coordinatorDelegate: CoordinatorDelegate? { get set }
}
