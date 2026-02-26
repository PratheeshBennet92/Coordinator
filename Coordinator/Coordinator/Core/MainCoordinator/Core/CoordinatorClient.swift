import Foundation
///CoordinatorClient declares all the navigation actions such as push, present, setroot and dismiss
public protocol CoordinatorClient: AnyObject {
  func push()
  func present()
  func setRoot()
  func dismiss()
  func pop()
  func popToRoot()
}
