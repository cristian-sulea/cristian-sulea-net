---

layout: post

date:        "2014-07-16"
title:       "The Singleton Pattern"
description: "Singleton pattern is a design solution where only one instance of a class is created, and provide a global point of access to the object."

categories: java singleton

resources:
  - "[Lazy initialization - Wikipedia](http://en.wikipedia.org/wiki/Lazy_initialization)"
  - "[Double-checked locking - Wikipedia](http://en.wikipedia.org/wiki/Double_checked_locking_pattern)"
  - "[Java Memory Model - Wikipedia](http://en.wikipedia.org/wiki/Java_Memory_Model)"
  - "[Initialization-on-demand holder idiom - Wikipedia](http://en.wikipedia.org/wiki/Initialization_on_demand_holder_idiom)"
  - "[http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html](http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html)"

---


Singleton pattern is a design solution where you can:
- ensure that only one instance of a class is created;
- provide a global point of access to the object;
- allow multiple instances in the future without affecting a singleton class's clients.


## Lazy initialization

In computer programming, <a href="https://en.wikipedia.org/wiki/Lazy_initialization">lazy initialization</a> is the tactic of delaying the creation of an object, the calculation of a value, or some other expensive process until the first time it is needed.

*EagerSingleton.java*

{% highlight java %}

public class EagerSingleton {

  private static volatile EagerSingleton instance = null;

  public static EagerSingleton getInstance() {

    if (instance == null) {
      synchronized (EagerSingleton.class) {
        if (instance == null) {
          instance = new EagerSingleton();
        }
      }
    }

    return instance;
  }

  // private constructor prevents instantiation from other classes
  private EagerSingleton() {}
}
{% endhighlight %}

This method uses [double-checked locking](http://en.wikipedia.org/wiki/Double_checked_locking_pattern), which should not be used prior to J2SE 5.0 as it is vulnerable to subtle bugs.


## Eager initialization

If the program will always need an instance, or if the cost of creating the instance is not too large in terms of time/resources, the programmer can switch to eager initialization, which always creates an instance.

*EagerSingleton.java*

{% highlight java %}

public class EagerSingleton {

  private static volatile EagerSingleton instance = new EagerSingleton();

  public static EagerSingleton getInstance() {
    return instance;
  }

  // private constructor prevents instantiation from other classes
  private EagerSingleton() {}
}
{% endhighlight %}

This method has a number of advantages:
- the instance is not constructed until the class is used;
- there is no need to synchronize the getInstance() method, meaning all threads will see the same instance and no (expensive) locking is required;
- the `final` keyword means that the instance cannot be redefined, ensuring that one (and only one) instance ever exists.


## Static block initialization

The static blocks are executed during the loading of class and even before the constructor is called so the programmer can use this feature in the singleton pattern.

*StaticBlockSingleton.java*

{% highlight java %}

public class StaticBlockSingleton {

  private static final StaticBlockSingleton INSTANCE;

  static {
    try {
      INSTANCE = new StaticBlockSingleton();
    } catch (Exception e) {
      throw new RuntimeException("Unexpected exception!!!...", e);
    }
  }

  public static StaticBlockSingleton getInstance() {
    return INSTANCE;
  }

  // private constructor prevents instantiation from other classes
  private StaticBlockSingleton() {}
}
{% endhighlight %}

This method has one drawback. Suppose there are 5 static fields in class and application code needs to access only 2 or 3, for which instance creation is not required at all. So, if we use this static initialization, we will have one instance created though we require it or not.


## Bill Pugh solution

Bill Pugh was main force behind [java memory model](http://en.wikipedia.org/wiki/Java_Memory_Model) changes. His principle ([initialization-on-demand holder idiom](http://en.wikipedia.org/wiki/Initialization_on_demand_holder_idiom)) also uses static block but in different way. It suggest to use static inner class.

*BillPughSingleton.java*

{% highlight java %}

public class BillPughSingleton {

  private static class LazyHolder {
    private static final BillPughSingleton INSTANCE = new BillPughSingleton();
  }

  public static BillPughSingleton getInstance() {
    return LazyHolder.INSTANCE;
  }

  // private constructor prevents instantiation from other classes
  private BillPughSingleton() {}
}
{% endhighlight %}

The `LazyHolder` is loaded on the first execution of `BillPughSingleton.getInstance()` or the first access to `LazyHolder.INSTANCE`, not before.


## Using Enum

This type of implementation recommend the use of `enum`. [Enum](http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html), as written in java docs, provide implicit support for thread safety and only one instance is guaranteed. This is also a good way to have singleton with minimum effort.

*EnumSingleton.java*

{% highlight java %}

public enum EnumSingleton {

  INSTANCE;

  public void doSomething(String param) {
    // perform operation here 
  }
}
{% endhighlight %}

The public method can be written to take any desired types of arguments; a single `String` argument is used here as an example.

This approach implements the singleton by taking advantage of Java's guarantee that any `enum` value is instantiated only once in a Java program. Since Java enum values are globally accessible, so is the singleton, initialized lazily by the classloader. The drawback is that the `enum` type is somewhat inflexible.


{% include resources.html %}
