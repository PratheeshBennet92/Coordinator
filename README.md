# Coordinator
## What is a coordinator?
Coordinator — a person whose job is to organise events or activities and to negotiate with others in order to ensure they work together effectively. 

In this context the navigation coordinators hold the exclusive responsibility of organising the navigations and flows in app instead of view-controllers owning the navigation responsibility. So you can think of coordinators as the Air Traffic Controller in a busy airport who carefully coordinates like who lands and who takes off in the runway.

## History
The term was coined by Khanlou. Please refer the link for more insights. 
https://khanlou.com/2015/01/the-coordinator/

## Coordinator Framework
The coordinators can manage the navigations of the relative context such as UIViewController in the case of a ChildCoordinator and UINavigationController in the case of MainCoordinator which instantiates and establishes the relation between the various child coordinators. Without coordinators the navigation logics are present inside the view controller which doesn’t make the code base scalable, maintainable and reusable. We end up in having the tight coupling of each view controller holding the information about the next view controller to be navigated.

The coordinator frameworks does most of the heavylifting by implementing the navigation logics onbehalf of the host application. To engineer the coordinator pattern, the coordinator framework uses Generic Decorators to do the actual navigation and presentation behaviours. Decorator is a structural pattern that allows adding new behaviours to objects dynamically by placing them inside special wrapper objects. The child coordinators manages the navigations and presentations where as main coordinator manages the child coordinators. In the case of tabbar based application there will be a dedicated TabCoordinatorr that manages all the main coordinators associated with each tab.


## Architecture
![alt text](https://github.com/PratheeshBennet92/Coordinator/blob/main/Coordinator.jpg)

## How to use?
You can drag and place the Coordinator.framework in your application and create the coordinators and take care of the navigations and presentations. 

MainCoordinators conforms to MainCoordinateClient protocol and decorates the MainCoordinatorDecorator that manages the child coordinators which inturn manages the rootview, navigations and presentations.

In the case of tabbar based application the TabCoordinator conforms to TabCoordinateClient and decorates the TabCoordinatorDecorator that enables to set the window and manages the main coordinators associated with each tab.

For detailed steps kindly refer the CoordinatorSampleApp.

## LICENSE

Copyright (c) 2021 Pratheesh Bennet

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Framework"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, without any conditions.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

