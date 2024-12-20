# Objects relationships	

Questions:
- Различие композиции и наследования.
- Причины выбора композиции.

Sources Used:
 - [Difference between composition and inheritance](https://tproger.ru/translations/inheritance-and-composition-in-java/)
 - [Why to use composition over inheritance](https://javarevisited.blogspot.com/2013/06/why-favor-composition-over-inheritance-java-oops-design.html)

---

## Определения

**Наследование** - это механизм при котором класс наследуется от существующего класса, наследую все его свойства и поведение, а так же имеет возможности расширения

**Композиция** - это механизм при котором объект содержит другие объекты внутри себя

> И наследование и композиция позволяют использовать код повторно

## Различия

Основное отличие между наследованием и композицией состоит в том, что композиция позволяет переиспользовать код без его расширения.

### Inheritance limitations 

Наследование является менее гибким инструментом (особенно в контексте языка swift):
1. `final` классы невозможно наследовать
2. отсутствует множественное наследование, соответственно, через наследование невозможно получить функциональность сразу нескольких классов

### Composition flexibility 

1. Из ограничений наследования можно вывести основное преимущество композиции - получение функциональности сразу нескольких классов.
2. При этом при соблюдении принципа подстановки Барбары Лисков (L from SOLID) у пользователя есть возможность передавать в классы расширенные с помощью композиции различные реализации компонентов.
    - Это улучшает тестируемость кода 
    - И дает больше возможностей к переиспользованию.

### Инкапсуляция

Важдной особенностью наследование является то, что эта техника нарушает принцип инкапсуляции, т.к. класс-наследник зависит от поведения родительского класса. Если поведение родителя изменится, то это повлияет и на наследников

## Причины выбора композиции

1. Получение функциональности сразу нескольких объектов
2. Упрощение тестирования компоненентов, расширенных с помощью композиции, легкая подмена компонентов.
3. Большое количество паттернов проектирования привычны именно в контексте использования композиции. Например, паттерн **Decorator** хранит в себе экземпляр декарируемого класса и не ожидает наследования для расширения.
4. Наследование нарушает инкапсуляцию
