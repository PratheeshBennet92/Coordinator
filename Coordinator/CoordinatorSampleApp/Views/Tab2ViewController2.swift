//
//  Tab2ViewController2.swift
//  CoordinatorSampleApp
//
//  Created by Pratheesh on 5/12/21.
//

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

        // Do any additional setup after loading the view.
    }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if self.isMovingFromParent {
      coordinatorDelegate?.pop(coordinator)
    }
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
