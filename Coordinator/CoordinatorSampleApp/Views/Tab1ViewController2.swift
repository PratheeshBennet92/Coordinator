//
//  Tab1ViewController2.swift
//  CoordinatorSampleApp
//
//  Created by Pratheesh on 5/12/21.
//

import UIKit
import Coordinator
protocol Tab1ViewController2CoordinatorDelegate: AnyObject {
  func pop(_ coordinator: CoordinatorClient?)
}
class Tab1ViewController2: UIViewController, CoordinateableView {
  var coordinator: CoordinatorClient?
  
  var coordinatorDelegate: Tab1ViewController2CoordinatorDelegate?
  
  typealias CoordinatorDelegate = Tab1ViewController2CoordinatorDelegate
  

    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .purple

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
