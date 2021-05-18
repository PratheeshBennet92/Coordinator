import UIKit
import Coordinator
protocol Tab1ViewController1CoordinatorDelegate: AnyObject {
  func push(_ coordinator: CoordinatorClient?)
}
class Tab1ViewController1: UIViewController, CoordinateableView {
  weak var coordinator: CoordinatorClient?
  weak var coordinatorDelegate: Tab1ViewController1CoordinatorDelegate?
  typealias CoordinatorDelegate = Tab1ViewController1CoordinatorDelegate
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .red
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    button.backgroundColor = UIView().tintColor
    button.setTitle("Push", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    self.view.addSubview(button)
  }
  @objc func buttonAction(sender: UIButton!) {
    coordinatorDelegate?.push(self.coordinator)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  deinit {
    print("Tab1ViewController1 denint")
  }
}
