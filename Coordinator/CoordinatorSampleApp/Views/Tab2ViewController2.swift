import UIKit
import Coordinator
protocol Tab2ViewController2CoordinatorDelegate: AnyObject {
  func pop(_ coordinator: CoordinatorClient?)
}
class Tab2ViewController2: UIViewController, CoordinateableView {
  weak var coordinator: CoordinatorClient?
  weak var coordinatorDelegate: Tab2ViewController2CoordinatorDelegate?
  typealias CoordinatorDelegate = Tab2ViewController2CoordinatorDelegate
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .green
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if self.isMovingFromParent {
      coordinatorDelegate?.pop(coordinator)
    }
  }
  deinit {
    print("Tab2ViewController2 denint")
  }
}
