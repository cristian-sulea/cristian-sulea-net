---

layout: post

title:       "Do not catch NullPointerException or any of its ancestors"
description: "A NullPointerException exception thrown at runtime indicates the existence of an underlying null pointer dereference that must be fixed in the application code."

categories: [java]
tags:       [NullPointerException]

resources:
  - "[CERT Secure Coding Standards](https://www.securecoding.cert.org/confluence/display/java/ERR08-J.+Do+not+catch+NullPointerException+or+any+of+its+ancestors)"

---


Handling the underlying `null` pointer dereference by catching the `NullPointerException` rather than fixing the underlying problem is inappropriate for several reasons:
- catching `NullPointerException` adds significantly more performance overhead than simply adding the necessary `null` checks;
- when multiple expressions in a try block are capable of throwing a `NullPointerException`, it is difficult or impossible to determine which expression is responsible for the exception because the `NullPointerException` catch block handles any `NullPointerException` thrown from any location in the try block;
- programs rarely remain in an expected and usable state after a `NullPointerException` has been thrown; attempts to continue execution after first catching and logging (or worse, suppressing) the exception rarely succeed.

Likewise, programs must not catch `RuntimeException`, `Exception`, or `Throwable`. Few, if any, methods are capable of handling all possible runtime exceptions. When a method catches `RuntimeException`, it may receive exceptions unanticipated by the designer, including `NullPointerException` and `ArrayIndexOutOfBoundsException`. Many catch clauses simply log or ignore the enclosed exceptional condition and attempt to resume normal execution. Do not suppress or ignore checked exceptions. Runtime exceptions often indicate bugs in the program that should be fixed by the developer and often cause control flow vulnerabilities.


## Noncompliant Code Example

This noncompliant code example defines an `isName()` method that takes a `String` argument and returns `true` if the given string is a valid name. A valid name is defined as two capitalized words separated by one or more spaces. Rather than checking to see whether the given string is `null`, the method catches `NullPointerException` and returns `false`.

{% highlight java %}

public boolean isName(String s) {
 
    try {
 
        String names[] = s.split(" ");
 
        if (names.length != 2) {
            return false;
        }
 
        return (isCapitalized(names[0]) && isCapitalized(names[1]));
    }
 
    catch (NullPointerException e) {
        return false;
    }
}
{% endhighlight %}


## Compliant Solution

This compliant solution explicitly checks the `String` argument for `null` rather than catching `NullPointerException`.

{% highlight java %}

boolean isName(String s) {
 
    if (s == null) {
        return false;
    }
 
    String names[] = s.split(" ");
    if (names.length != 2) {
        return false;
    }
 
    return (isCapitalized(names[0]) && isCapitalized(names[1]));
}
{% endhighlight %}


## Compliant Solution

This compliant solution omits an explicit check for a `null` reference and permits a `NullPointerException` to be thrown.

{% highlight java %}

boolean isName(String s) /* throws NullPointerException */ {
 
    String names[] = s.split(" ");
    if (names.length != 2) {
        return false;
    }
 
    return (isCapitalized(names[0]) && isCapitalized(names[1]));
}
{% endhighlight %}


{% include resources.html %}
