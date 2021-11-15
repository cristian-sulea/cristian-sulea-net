---

layout: post

title:       "Set the Look and Feel in Java"
description: "How to change the look and feel of Swing applications. The 'look' of an application refers to its appearance. The 'feel' refers to how the widgets behave."

categories: [java]
tags:       [laf, look and feel]

---


To programmatically specify a look and feel, use one of the methods:
- [UIManager.setLookAndFeel(String className)](http://docs.oracle.com/javase/7/docs/api/javax/swing/UIManager.html#setLookAndFeel(java.lang.String))
- [UIManager.setLookAndFeel(LookAndFeel newLookAndFeel)](http://docs.oracle.com/javase/7/docs/api/javax/swing/UIManager.html#setLookAndFeel(javax.swing.LookAndFeel))

For example, the following snippet makes the program use the **Java Look & Feel** for the current platform:

```java
public static void main(String[] args) {

  //
  // set the look and feel

  try {
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } catch (Exception e) {
    // ignore exception
  }

  //
  // create and show the GUI

  new SwingApplication();
}
```

To specify a particular UI, you can use the actual class name.
Here are some of the arguments you can use for `#setLookAndFeel(String className)` method:

- `UIManager.getCrossPlatformLookAndFeelClassName()`
	- Returns the string for the one look-and-feel guaranteed to work - the *Java Look & Feel*.

- `UIManager.getSystemLookAndFeelClassName()`
	- Specifies the look and feel for the current platform. On Win32 platforms, this specifies the Windows Look & Feel. On Mac OS platforms, this specifies the Mac OS Look & Feel. On Sun platforms, it specifies the *CDE/Motif Look & Feel*.

- `javax.swing.plaf.metal.MetalLookAndFeel`
	- Specifies the *Java Look & Feel* (the codename for this look and feel was Metal). This string is the value returned by the getCrossPlatformLookAndFeelClassName method.

- `com.sun.java.swing.plaf.windows.WindowsLookAndFeel`
	- Specifies the *Windows Look & Feel*. Currently, you can use this look and feel only on Win32 systems.

- `com.sun.java.swing.plaf.motif.MotifLookAndFeel`
	- Specifies the *CDE/Motif Look & Feel*. This look and feel can be used on any platform.

- `javax.swing.plaf.mac.MacLookAndFeel`
	- Specifies the *Mac OS Look & Feel*, which can be used only on Mac OS platforms.

You aren't limited to the preceding arguments.
You can specify the name for any look and feel that is in your program's class path.


## How the UI Manager Chooses the Look and Feel

Steps that occur when the UI manager first initializes itself:

1. If the program sets the look and feel before any components are created, the UI manager tries to create an instance of the specified look-and-feel class. If successful, all components use that look and feel.
2. If the program hasn't successfully specified a look and feel, then before the first component's UI is created, the UI manager tests whether the user specified a look and feel in a file named `swing.properties`. It looks for the file in the `lib` directory of the Java release. For example, if you're using the Java interpreter in `javaHomeDirectory\bin`, then the `swing.properties` file (if it exists) is in `javaHomeDirectory\lib`. If the user specified a look and feel, then again the UI manager tries to instantiate the specified class.
3. If neither the program nor the user successfully specifies a look and feel, then the program uses the Java Look &amp; Feel.

Example of a `swing.properties` file:

```properties
swing.defaultlaf = com.sun.java.swing.plaf.motif.MotifLookAndFeel
```


## Change the Look and Feel After Startup

You can change the look and feel with [UIManager.setLookAndFeel(String className)](http://docs.oracle.com/javase/7/docs/api/javax/swing/UIManager.html#setLookAndFeel(java.lang.String)) methods even after the program's GUI is visible.
To make existing components reflect the new look and feel, invoke the <a href="http://docs.oracle.com/javase/7/docs/api/javax/swing/UIManager.html#setLookAndFeel(javax.swing.LookAndFeel)">SwingUtilities.updateComponentTreeUI(Component c)</a> method once per top-level container.
Then you might wish to resize each top-level container to reflect the new sizes of its contained components.

For example:

```java
UIManager.setLookAndFeel(lafName);
SwingUtilities.updateComponentTreeUI(frame);
frame.pack();
```