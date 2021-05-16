import Foundation
public protocol CoordinatorClient: AnyObject {
  func push()
  func present()
  func setRoot()
  func dismiss()
}
