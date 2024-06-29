# SOLID

Questions:
- Необходимо изложить определения, раскрыть смысл и привести примеры нарушений каждого принципа из аббревиатуры SOLID.

Sources Used:
- [General info](http://sergeyteplyakov.blogspot.com/2014/10/solid.html)
- [SOLID in object oriented design](https://www.baeldung.com/solid-principles)
- [Swift SOLID](https://betterprogramming.pub/swift-s-o-l-i-d-21203ba3a226)

---

## S (Single Responsibility Principle)

_У класса/модуля должна быть лишь одна причина для изменения._ 

Призван бороться со сложностью, возникающей, когда класс/модуль начинает отвечать сразу за несколько аспектов поведения.

**Преимущества:**<BR>
1. Упрощение тестирования классов
2. Уменьшение количества зависимостей одного класса
3. Улучшение огранизации кода

**Пример нарушения:**<BR>
```swift
public class Employee {
    // some employee data

    public func calculatePay() -> Double {
    }

    public func getWorkingHours() -> Time {
    }

    public func save() {
    }
}
```

Класс Employee нарушает принцип единственной ответственности, т.к. его методы используются используются сразу несколькими акторами:
- `save` использоваться для сохранения класса в БД
- `getWorkingHours` используется для получения рабочих часов
- `calculatePay` используется для определения заработной платы

**Пример решения**<BR>
Существует несколько возможных решений нарушения принципа единственной ответственности:
1. отделение данных от функций
2. использование шаблона проектирования Facade

```swift
// MARK: - Отделение данных от функций

public struct EmployeeData: Codable {
    // some data
}

open class BasePayCalculator {
    public func calculatePay(employee: EmployeeData) -> Double {
    }
}

open class BaseHourReporter {
    public func getWorkingHours(employee: EmployeeData) -> Time {
    }
}

open class BaseDBSaver {
    public func save<T: Encodable>(object: T) {
    }
}

// MARK: - Применение шаблона Фасад

public class EmployeeFacade {

    let payCalculator: BasePayCalculator
    let hourReporter: BaseHourReporter
    let dbSaver: BaseDBSaver

    public init(payCalculator: BasePayCalculator,
                hourReporter: BaseHourReporter,
                dbSaver: BaseDBSaver) {
        self.payCalculator = payCalculator
        self.hourReporter = hourReporter
        self.dbSaver = dbSaver
    }

    public func calculatePay(employee: EmployeeData) -> Double {
        payCalculator.calculatePay(employee: employee)
    }

    public func getWorkingHours(employee: EmployeeData) -> Time {
        hourReporter.getWorkingHours(employee: employee)
    }

    public func save(employee: EmployeeData) {
        dbSaver.save(object: employee)
    }
}
```

## O (Open-Closed Principle)

_Программные сущности (классы, модули, функции и т.п.) должны быть открытыми для расширения, но закрытыми для модификации._

Иными словами у пользователя должна иметься возможность расширять поведение программы без внесения изменений в существующие программные сущности.

**Преимущества:**<BR>
- потенциальное предотвращение появление новых багов

**Пример нарушения:**<BR>
```swift
class ReportPresenter {
    func printReport() {
    }

    func presentReportAsView() {
    }
}
```

Класс `ReportPresenter` нарушает принцип открытости-закрытости, т.к. если пользователю необходимо будет выводить отчет киким либо иным образом, то ему придется добавить новый метод (модифицировать класс).

**Пример решения**<BR>
Создадим унифицированный интерфейс, который необходимо будет имлементировать сущностям отвечающим за показ отчета

```swift
protocol ReportPresentable {
    func showReport()
}

class ReportPrinter: ReportPresentable {
    func showReport() {
    }
}

class ReportViewPresenter: ReportPresentable {
    func showReport() {
    }
}

class ReportPresenter {
    func present(report: ReportPresentable) {
    }
}
```

## L (Liskov Substitution Principle)

_Должна быть возможность вместо базового типа подставить любой его подтип._

Т.е. классы, которые не могут действовать как унаследованные классы и нуждаются в разработке для конкретной ситуации, нарушают данный принцип.

**Пример нарушения:**<BR>
Известная пролема квадрат/прямоугольник:

```swift
open class Rectangle {
    private var width: Double = .zero
    private var height: Double = .zero

    open func setWidth(_ w: Double) {
        width = w
    }

    open func setHeight(_ h: Double) {
        height = h
    }

    open func getArea() -> Double {
        width * height
    }
}

final class Square: Rectangle {
    func setSide(_ s: Double) {
        width = s
        height = s
    }
}

let rect: Rectangle = Square()
rect.setHeight(5)
rect.setWidth(2)

// Got: 10
// But rect isn't actually a square 🤷‍♂️, and this is wrong
print(rect.getArea())
```

Принцип подстановки Барбары Лисков нарушается, т.к. при использовании методов `setHeight(_:)`, `setWidth(_:)` на экземпляре `Square` пользователь не получит ожидаемого результата при использовании метода `getArea()`

**Пример решения**<BR>
В зависимости от ситуации решения могут быть разнообразными. Например, если целью является получение площади, то можно разделить квадрат и прямоугольник, подписав на общий протокол

```swift
protocol GeometricFigure {
    func getArea() -> Double
}

final class Rectangle: GeometricFigure {
    private var width: Double = .zero
    private var height: Double = .zero

    func setWidth(_ w: Double) {
        width = w
    }

    func setHeight(_ h: Double) {
        height = h
    }

    func getArea() -> Double {
        width * height
    }
}

final class Square: GeometricFigure {
    private var side: Double = .zero
    
    func setSide(_ s: Double) {
        side = s
    }

    func getArea() -> Double {
        side * side
    }
}
```

## I (Interface Segregation Principle)

_Клиенты не должны вынужденно зависеть от методов, которыми не пользуются._

Смысл `self describing`

**Пример нарушения:**<BR>
```swift
protocol Logger {
    func logToConcole(_ event: Event)
    func debugPrint(_ event: Event)
}

final class ConcoleLogger: Logger {
    func logToConcole(_ event: Event) {
        log(event)
    }

    func debugPrint(_ event: Event) {
        // no implementation
    }
}

final class DebugLogger: Logger {
    func logToConcole(_ event: Event) {
        // no implementation
    }

    func debugPrint(_ event: Event) {
        print(event)
    }
}
```

Протокол `Logger` нарушает принцип разделения интерфейсов, т.к. вынуждает пользователя реализовывать методы, которые он возможно не хочет иметь в своей реализации

**Пример решения**<BR>
Для решения проблемы необходимо разделить имеющийся интерфейс на несколько поменьше:

```swift
protocol Logger {
    func logToConcole(_ event: Event)
}

protocol DebugPrinter {
    func debugPrint(_ event: Event)
}

final class ConcoleLogger: Logger {
    func logToConcole(_ event: Event) {
        log(event)
    }
}

final class DebugLogger: DebugPrinter {
    func debugPrint(_ event: Event) {
        print(event)
    }
}
```

## D (Dependency Inversion Principle)

_Модули верхнего уровня не должны зависеть от модулей нижнего уровня. И те и другие должны зависеть от абстракций._

**Преимущества:**<BR>
- Блягодяря абстракциям можно управлять "устойчивостью" компонентов
- Улучшается тестируемость модулей

**Пример нарушения:**<BR>
```swift
final class CoreDataFetcher {
    func fetchProducts() -> [Product] {
    }
}

final class ProductsViewModel {
    private var dataFetcher: CoreDataFetcher

    init(dataFetcher: CoreDataFetcher) {
        self.dataFetcher = dataFetcher
    }

    func fetchProducts() -> [Product] {
        dataFetcher.fetchProducts()
    }
}
```

В данном случае класс `ProductsViewModel` нарушает принцип инверсии зависимостей, т.к. зависит от конкретной имплементации `CoreDataFetcher` (т.е. модуль верхнего уровня зависит от модуля нижнего)

**Пример решения**<BR>
Для решения проблемы необходимо ввести абстрактный интерфейс для `dataFetcher`'а

```swift
protocol ProductsFetcher {
    assosiatedType Data

    func fetchProducts() -> [Product]
}

final class CoreDataProductsFetcher: ProductsFetcher {
    func fetchProducts() -> [Product]
    }
}

final class ProductsViewModel {
    private var dataFetcher: ProductsFetcher

    init(dataFetcher: ProductsFetcher) {
        self.dataFetcher = dataFetcher
    }

    func fetchProducts() -> [Product] {
        dataFetcher.fetchProducts()
    }
}
```

> Невозможно полностью устранить нарушения принципа инверсии зависимостей. В системе будет существовать как минимум один такой компонент. Как правило он содержит имя `main`
