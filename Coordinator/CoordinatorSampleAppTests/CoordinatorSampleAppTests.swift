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
  var mainCoordinator: TabOneCoordinator?
  override func setUpWithError() throws {
    tabCoordinator = TabCoordinator(coordinator: TabCoordinatorDecorator(window: UIWindow(frame: UIScreen.main.bounds)))
    tabCoordinator?.setRoot()
    tabCoordinator?.setUpChildCoordinators()
    mainCoordinator = TabOneCoordinator(mainCoordinator: MainCoordinatorDecorator())
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
  func testMainCoordinator() {
    mainCoordinator?.setRoot()
    mainCoordinator?.coordinator.removeChildCoordinator(mainCoordinator?.coordinator.childCoordinators?.first)
  }
  func testMainCoordinatorPush() {
    mainCoordinator?.coordinator?.childCoordinators?.removeAll()
    let viewOneCoordinator = ViewCoordinator<Tab1ViewController2>((mainCoordinator?.coordinator.navigationController)!, delegate: mainCoordinator)
    viewOneCoordinator.push()
    mainCoordinator?.coordinator?.childCoordinators?.append(viewOneCoordinator)
    XCTAssert(viewOneCoordinator.view != nil)
  }
  func testMainCoordinatorPop() {
    mainCoordinator?.coordinator?.childCoordinators?.removeAll()
    let viewOneCoordinator = ViewCoordinator<Tab1ViewController2>((mainCoordinator?.coordinator.navigationController)!, delegate: mainCoordinator)
    viewOneCoordinator.push()
    mainCoordinator?.coordinator?.childCoordinators?.append(viewOneCoordinator)
    mainCoordinator?.pop(mainCoordinator?.coordinator.childCoordinators?.first)
    mainCoordinator?.coordinator.removeChildCoordinator(viewOneCoordinator)
    XCTAssert(mainCoordinator?.coordinator?.childCoordinators?.count == 0)
  }
  func testMainCoordinatorPresent() {
    mainCoordinator?.coordinator?.childCoordinators?.removeAll()
    let viewOneCoordinator = ViewCoordinator<Tab1ViewController2>((mainCoordinator?.coordinator.navigationController)!, delegate: mainCoordinator)
    viewOneCoordinator.present()
    mainCoordinator?.coordinator?.childCoordinators?.append(viewOneCoordinator)
    XCTAssert(viewOneCoordinator.view != nil)
  }
  func testMainCoordinatorDismiss() {
    mainCoordinator?.coordinator?.childCoordinators?.removeAll()
    let viewOneCoordinator = ViewCoordinator<Tab1ViewController2>((mainCoordinator?.coordinator.navigationController)!, delegate: mainCoordinator)
    viewOneCoordinator.present()
    mainCoordinator?.coordinator?.childCoordinators?.append(viewOneCoordinator)
    viewOneCoordinator.dismiss()
    mainCoordinator?.coordinator.removeChildCoordinator(viewOneCoordinator)
    XCTAssert(mainCoordinator?.coordinator?.childCoordinators?.count == 0)
  }
}
