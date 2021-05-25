# Coordinator
## What is a coordinator?
Coordinator — a person whose job is to organise events or activities and to negotiate with others in order to ensure they work together effectively. 

In this context the navigation coordinators hold the exclusive responsibility of organising the navigations and flows in app instead of view-controllers owning the navigation responsibility. So you can think of coordinators as the Air Traffic Controller in a busy airport who carefully coordinates like who lands and who takes off in the runway.

## History
The term was coined by Khanlou. Please refer the link for more insights. 
https://khanlou.com/2015/01/the-coordinator/

## Coordinators
To engineer the coordinator pattern further, I have used Generic Decorators to do the actual navigation and presentation behaviours.
Decorator is a structural pattern that allows adding new behaviours to objects dynamically by placing them inside special wrapper objects.
The coordinators can manage the navigations of the relative context such as UIViewController in the case of a ChildCoordinator and UINavigationController in the case of MainCoordinator which instantiates and establishes the relation between the various child coordinators. 

## Architecture
![alt text](https://github.com/PratheeshBennet92/Coordinator/blob/main/Coordinator.jpg)
