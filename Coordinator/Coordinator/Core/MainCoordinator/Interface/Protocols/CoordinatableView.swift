import Foundation
/**
 UIViewController conforms to the CoordinateableView protocol
 UIViewController to have a weak reference of coordinator and coordinatorDelegate
*/
public protocol CoordinateableView {
  var coordinator: CoordinatorClient? {get set}
  associatedtype CoordinatorDelegate
  var coordinatorDelegate: CoordinatorDelegate? { get set }
}
