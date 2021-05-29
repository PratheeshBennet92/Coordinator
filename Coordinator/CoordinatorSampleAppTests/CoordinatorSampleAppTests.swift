//
//  CoordinatorSampleAppTests.swift
//  CoordinatorSampleAppTests
//
//  Created by Pratheesh on 5/12/21.
//

import XCTest
import Coordinator
@testable import CoordinatorSampleApp

class CoordinatorSampleAppTests: XCTestCase {
  var tabCoordinator: TabCoordinator?
  override func setUpWithError() throws {
    tabCoordinator = TabCoordinator(coordinator: TabCoordinatorDecorator(window: UIWindow(frame: UIScreen.main.bounds)))
    tabCoordinator?.setRoot()
    tabCoordinator?.setUpChildCoordinators()
  }

  override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

func testTabCoordinator() {
  XCTAssert(tabCoordinator?.coordinator?.childCoordinators?.count == 2)
  XCTAssert(tabCoordinator?.coordinator?.childCoordinators?[0].coordinator.navigationController != nil)
  XCTAssert(tabCoordinator?.coordinator?.childCoordinators?[1].coordinator.navigationController != nil)
 
}
func testRootViews() {
  XCTAssert(tabCoordinator?.coordinator?.childCoordinators?[0].coordinator.navigationController.viewControllers[0] as? Tab1ViewController1  != nil)
  XCTAssert(tabCoordinator?.coordinator?.childCoordinators?[1].coordinator.navigationController.viewControllers[0] as? Tab2ViewController1  != nil)
 }
}
