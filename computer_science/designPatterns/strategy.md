# Strategy

**Strategy** is a behavioral design pattern which incapsulates a family of
algorighms making them interchangeable.

## Structure

- `Strategy`: common for a family of algorithms interface
- `ConcreateStrategy`: realisation of a certain algorithm from the family that
inferes `Strategy` interface
- `Context`: object that holds an object of type `Strategy`, passes all
necessary data to the `ConcreateStrategy`

@startuml interface Strategy

class ConcreateStrategy implements Strategy

class Context { strategy: Strategy }

Context o-- Strategy : holds

@enduml

## Pros and Cons

- ✅ using one interface for multiple objects that differs only by behavior.
Inheritance allows to define common behavior and reuse it in ancestors.
- ✅ incapsulation of the algorithm in a separate class allows to change it any
time without affecting a `Context`
- ✅ a user can choose by himself what algorithm to use and change it in
runtime
- ✅ strategy design pattern removes branching when there is a need to choose
an algorithm:

    ```swift // Before class Context: Strategy { func runAlgorithm() { switch
    condition { case .cond1: ConcreateStrategy1() case .cond2:
        ConcreateStrategy2() } } }

    // After class Context: Strategy { func runAlgorithm() {
    self.strategy.runAlgorithm() } } ```

- ⛔ clients should know how concreate strategies work
- ⛔ difficulties with communication between strategy and contex. Context has
various of methods to pass parameters to strategy. Firstly, it can pass itself.
This way context should make its public interface wider. Secondly, it can pass
only needed parameters. Unfortunetly, if the user has to concreate strategies
and one should have more setting then the other, `Strategy` interface will have
more settings to cover every implementation even if some users won't use some
settings at all.
