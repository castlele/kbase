# Abstract Factory

**Abstract factory** is a creational design pattern the goal of which is to
create a family of related or non related objects.

## Structure

- `Abstract Factory`: annaunces an interface for creation of `Abstract Products`
- `Concrete Factory`: implements an `Abstract Factory` interface with creation of the `Concrete Products`
- `Abstract Product`: requires an interface for `Concrete Product`
- `Concrete Product`: implements `Abstract Product`

@startuml interface Strategy

interface AbstractFactory {
    AbstractProduct createProductA()
    AbstractProduct createProductB()
}

class ConcreteFactory1 implements AbstractFactory {
    AbstractProduct createProductA()
    AbstractProduct createProductB()
}

class ConcreteFactory2 implements AbstractFactory {
    AbstractProduct createProductA()
    AbstractProduct createProductB()
}

interface AbstractProduct

class ConcreteProductA1 implements AbstractProduct
class ConcreteProductB1 implements AbstractProduct

class ConcreteProductA2 implements AbstractProduct
class ConcreteProductB2 implements AbstractProduct

ConcreteFactory1 ..> ConcreteProductA1
ConcreteFactory1 ..> ConcreteProductB1
ConcreteFactory2 ..> ConcreteProductA2
ConcreteFactory2 ..> ConcreteProductB2

@enduml

## Pros and Cons

- ✅ Cliend know nothing about concrete realizations and their setup, he works
with an interface
- ✅ Design pattern makes working with families of objects more consistent. For
example, if you only should work with one family at a time, abstract factory
will promise to give only one family of the products
- ✅ Makes it easy to swap families with each other
- ⛔ Task to add a new type of product is still hard with this pattern. You
should modify common interface for this and all of the ancestors

## Tips and Tricks

`Abstract factory` design pattern can be implemented with only one creational
method in the interface signature, but with some kind of parameter for
determination of the type of an product. This is more unsafe realization and
corelate more with `Prototype` realization.
