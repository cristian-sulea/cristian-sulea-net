---

layout: post

title:       "java.lang.UnsatisfiedLinkError no ***.dll in java.library.path"
description: "The UnsatisfiedLinkError is thrown if the Java Virtual Machine cannot find an appropriate native-language definition of a method declared native."

categories: [java]

resources:
  - "[Stack Overflow](http://stackoverflow.com/questions/1403788/java-lang-unsatisfiedlinkerror-no-dll-in-java-library-path)"

---


The `UnsatisfiedLinkError` is thrown if the Java Virtual Machine cannot find an appropriate native-language definition of a method declared native.

In order for `System.loadLibrary()` to work, the library (on Windows, a DLL) must be in a directory somewhere on your `PATH` or on a path listed in the `java.library.path` system property, so you can launch Java like:

```terminal
java -Djava.library.path=/path/to/dir
```

Additionally, for `loadLibrary()`, you specify the base name of the library, without the `.dll` at the end. So, for `/path/to/dir/foo.dll`, you would just use:

```java
System.loadLibrary("foo")
```

You also need to look at the exact UnsatisfiedLinkError that you are getting. If it says something like:

> Exception in thread "main" java.lang.UnsatisfiedLinkError: no foo in java.library.path

then it can't find the foo library (`foo.dll`) in your `PATH` or `java.library.path` specified at launch time.

If it says something like:

> Exception in thread "main" java.lang.UnsatisfiedLinkError: com.example.program.ClassName.foo()V

then something is wrong with the library itself in the sense that Java is not able to map a native Java function in your application to its actual native counterpart.

To start with, I would put some logging around your `System.loadLibrary()` call to see if that executes properly.
If it throws an exception or is not in a code path that is actually executed, then you will always get the latter type of `UnsatisfiedLinkError` explained above.

As a side note, most people put their `loadLibrary()` calls into a static initializer block in the class with the native methods, to ensure that it is always executed exactly once:

```java
public class Foo {

    static {
        System.loadLibrary("foo");
    }

    public Foo() {}

}
```


{% include resources.html %}