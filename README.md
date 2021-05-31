# Coordinator
## What is a coordinator?
Coordinator — a person whose job is to organise events or activities and to negotiate with others in order to ensure they work together effectively. 

Navigation coordinators hold the exclusive responsibility of organising the navigations and flows in app instead of view-controllers owning the navigation responsibility. So you can think of coordinators as the Air Traffic Controller in a busy airport who carefully coordinates like who lands and who takes off in the runway.

## History
The term was coined by Khanlou. Please refer the link for more insights. 
https://khanlou.com/2015/01/the-coordinator/

## Coordinator Framework
The coordinators can manage the navigations of the relative context such as UIViewController in the case of a ChildCoordinator and UINavigationController in the case of MainCoordinator which instantiates and establishes the relation between the various child coordinators. Without coordinators the navigation logics are present inside the view controller which doesn’t make the code base scalable, maintainable and reusable. We end up in having the tight coupling of each view controller holding the information about the next view controller to be navigated.

The coordinator frameworks does most of the heavylifting by implementing the navigation logics onbehalf of the host application. To engineer the coordinator pattern, the coordinator framework uses Generic Decorators to do the actual navigation and presentation behaviours. Decorator is a structural pattern that allows adding new behaviours to objects dynamically by placing them inside special wrapper objects. The child coordinators manages the navigations and presentations where as main coordinator manages the child coordinators. Each child coordinator is spawned by its parent main coordinator. In the case of tabbar based application there will be a dedicated TabCoordinatorr that manages all the main coordinators associated with each tab.

The Coordinator.framework helps to create the coordinator objects in your app. MainCoordinators conforms to MainCoordinateClient protocol and decorates the MainCoordinatorDecorator that manages the child coordinators which inturn manages the rootview, navigations and presentations. Each child coordinator is an instance of generic class ViewCoordinator. In the case of tabbar based application the TabCoordinator conforms to TabCoordinateClient and decorates the TabCoordinatorDecorator that enables to set the window and manages the main coordinators associated with each tab.


## Coordinator Framework Architecture
![alt text](https://github.com/PratheeshBennet92/Coordinator/blob/main/Coordinator.jpg)

## How to use?
You can drag and place the Coordinator.framework in your application and create the coordinators and take care of the navigations and presentations. 

#### MainCoordinator
MainCoordinators conforms to MainCoordinateClient protocol and decorates the MainCoordinatorDecorator that manages the child coordinators which inturn manages the rootview, navigations and presentations.
```
import Coordinator
class MainCoordinator: MainCoordinateClient {
  var coordinator: MainCoordinatorDecorator!
  required init() {}
  func setRoot() {
  let childCoordinator = ViewCoordinator<YourViewController>(self.coordinator.navigationController, delegate: self)
  childCoordinator.setRoot()
  self.coordinator.addChildCoordinator(childCoordinator)
  }
}

```
#### ChildCoordinator
Each child coordinator is an instance of generic class ViewCoordinator. The child coordinators manages the navigations and presentations where as main coordinator manages the child coordinators. Each child coordinator is spawned by its parent main coordinator. Access and inject properties to the view controller using ChildCoordinator.view property

```
extension MainCoordinator: YourViewControllerCoordinatorDelegate {
  func push(_ coordinator: CoordinatorClient?) {
  let childCoordinator = ViewCoordinator<YourNextViewController>(self.coordinator.navigationController, delegate: self)
  //access view controller using childCoordinator.view for  configurations and dependacy injections
  childCoordinator.push()
  self.coordinator.addChildCoordinator(childCoordinator)
  }
}
```

#### TabCoordinator
In the case of tabbar based application the TabCoordinator conforms to TabCoordinateClient and decorates the TabCoordinatorDecorator that enables to set the window and manages the main coordinators associated with each tab.
```
import Coordinator
class TabCoordinator: TabCoordinateClient {
  var coordinator: TabCoordinatorDecorator!
  required init() {}
  func setRoot() {
    self.coordinator.setRoot()
  }
  func setUpChildCoordinators() {
    setupTabOneJourney()
    setupTabTwoJourney()
    setupTabViews()
  }
  func setupTabViews() {
      // setup tabview
  }
  private func setupTabOneJourney() {
    let tabOneMainCoordinator = MainCoordinator(mainCoordinator: MainCoordinatorDecorator())
    tabOneMainCoordinator.setRoot()
    coordinator.childCoordinators?.append(tabOneMainCoordinator)
  }
  private func setupTabTwoJourney() {
    let tabTwoMainCoordinator = MainCoordinator(mainCoordinator: MainCoordinatorDecorator())
    tabTwoMainCoordinator.setRoot()
    coordinator.childCoordinators?.append(tabTwoMainCoordinator)
  }
}
```
#### ViewController
The viewcontroller has to conform to the CoordinateableView protocol.
```
import Coordinator
protocol YourViewControllerCoordinatorDelegate: AnyObject {
  func push(_ coordinator: CoordinatorClient?)
}
class YourViewController: UIViewController, CoordinateableView {
  weak var coordinator: CoordinatorClient?
  weak var coordinatorDelegate: Tab1ViewController1CoordinatorDelegate?
  typealias CoordinatorDelegate = Tab1ViewController1CoordinatorDelegate
}
```

For detailed steps kindly refer the CoordinatorSampleApp.

## Sonar Report
![alt text](https://github.com/PratheeshBennet92/Coordinator/blob/main/Sonar%20Report.png)


## LICENSE

MIT License

Copyright (c) 2021 PratheeshBennet92

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
