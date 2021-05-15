//
//  Tab1ViewController1.swift
//  CoordinatorSampleApp
//
//  Created by Pratheesh on 5/12/21.
//

import UIKit
import Coordinator
protocol CoordinatorPushDelegate: AnyObject {
  func push(_ coordinator: CoordinatorClient?)
}
class Tab1ViewController1: UIViewController, CoordinateableView {
  var coordinator: CoordinatorClient?
  var coordinatorDelegate: CoordinatorPushDelegate?
  typealias CoordinatorDelegate = CoordinatorPushDelegate
  

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    coordinatorDelegate?.push(self.coordinator)
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
