import UIKit
import Coordinator
protocol Tab1ViewController2CoordinatorDelegate: AnyObject {
  func pop(_ coordinator: CoordinatorClient?)
}
class Tab1ViewController2: UIViewController, CoordinateableView {
  weak var coordinator: CoordinatorClient?
  weak var coordinatorDelegate: Tab1ViewController2CoordinatorDelegate?
  typealias CoordinatorDelegate = Tab1ViewController2CoordinatorDelegate
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .purple
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if self.isMovingFromParent {
      coordinatorDelegate?.pop(coordinator)
    }
  }
  deinit {
    print("Tab1ViewController2 denint")
  }
}
