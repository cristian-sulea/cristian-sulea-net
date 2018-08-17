---

layout: post

date:        "2015-01-20"
title:       "Do not catch NullPointerException or any of its ancestors"
description: "A NullPointerException exception thrown at runtime indicates the existence of an underlying null pointer dereference that must be fixed in the application code."

categories: java

resources:
  - "[CERT Secure Coding Standards](https://www.securecoding.cert.org/confluence/display/java/ERR08-J.+Do+not+catch+NullPointerException+or+any+of+its+ancestors)"

---


Handling the underlying <code>null</code> pointer dereference by catching the <code>NullPointerException</code> rather than fixing the underlying problem is inappropriate for several reasons:
- catching <code>NullPointerException</code> adds significantly more performance overhead than simply adding the necessary <code>null</code> checks;
- when multiple expressions in a try block are capable of throwing a <code>NullPointerException</code>, it is difficult or impossible to determine which expression is responsible for the exception because the <code>NullPointerException</code> catch block handles any <code>NullPointerException</code> thrown from any location in the try block;
- programs rarely remain in an expected and usable state after a <code>NullPointerException</code> has been thrown; attempts to continue execution after first catching and logging (or worse, suppressing) the exception rarely succeed.

Likewise, programs must not catch <code>RuntimeException</code>, <code>Exception</code>, or <code>Throwable</code>. Few, if any, methods are capable of handling all possible runtime exceptions. When a method catches <code>RuntimeException</code>, it may receive exceptions unanticipated by the designer, including <code>NullPointerException</code> and <code>ArrayIndexOutOfBoundsException</code>. Many catch clauses simply log or ignore the enclosed exceptional condition and attempt to resume normal execution. Do not suppress or ignore checked exceptions. Runtime exceptions often indicate bugs in the program that should be fixed by the developer and often cause control flow vulnerabilities.


## Noncompliant Code Example

This noncompliant code example defines an <code>isName()</code> method that takes a <code>String</code> argument and returns <code>true</code> if the given string is a valid name. A valid name is defined as two capitalized words separated by one or more spaces. Rather than checking to see whether the given string is <code>null</code>, the method catches <code>NullPointerException</code> and returns <code>false</code>.

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

This compliant solution explicitly checks the <code>String</code> argument for <code>null</code> rather than catching <code>NullPointerException</code>.

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

This compliant solution omits an explicit check for a <code>null</code> reference and permits a <code>NullPointerException</code> to be thrown.

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
