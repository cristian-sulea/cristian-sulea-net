---

layout: post

title:       "Design Patterns - Overview"
description: "A design pattern is a common, well-described solution to a common software problem. Sensible use of design patterns results in increased code maintainability."

categories: [software development]
tags:       [design patterns]

resources:
  - "[AVAJAVA Web Tutorials](http://www.avajava.com/tutorials/categories/design-patterns)"
  - "[Tutorials Point](http://www.tutorialspoint.com/design_pattern/index.htm)"

---


A design pattern is a common, well-described solution to a common software problem. Sensible use of design patterns results in increased code maintainability, since in addition to being a good solution to a common problem, design patterns can be recognized by other developers, thus reducing the learning curve when dealing with a particular piece of code.


## Gang of Four (GOF)

In 1994, four authors Erich Gamma, Richard Helm, Ralph Johnson and John Vlissides published a book titled **Design Patterns - Elements of Reusable Object-Oriented Software** which initiated the concept of Design Pattern in Software Development.

These authors are collectively known as **Gang of Four (GOF)**.

According to these authors design patterns are primarily based on the following principles of object orientated design:
- program to an interface not an implementation;
- favor object composition over inheritance.


## Types of Design Patterns

As per the design pattern reference book "Design Patterns - Elements of Reusable Object-Oriented Software", there are 23 design patterns which can be classified in three categories: **Creational**, **Structural** and **Behavioral** patterns.


### Creational Patterns

These design patterns provide a way to create objects while hiding the creation logic, rather than instantiating objects directly using new operator. This gives program more flexibility in deciding which objects need to be created for a given use case.


### Structural Patterns

These design patterns concern class and object composition. Concept of inheritance is used to compose interfaces and define ways to compose objects to obtain new functionalities.


### Behavioral Patterns

These design patterns are specifically concerned with communication between objects.


{% include resources.html %}
