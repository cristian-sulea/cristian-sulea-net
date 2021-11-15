---

layout: post

title:       "Parse Files Recursively using Java 7+"
description: "A FileVisitor can be used to recursively visit all the files in folder. The interface specifies the required behavior at key points in the traversal process."

categories: [java]
tags:       [files]

---


To walk a file tree is a relatively simple task. It can be done with the [FileVisitor](http://docs.oracle.com/javase/7/docs/api/java/nio/file/FileVisitor.html) interface.
A `FileVisitor` specifies the required behavior at key points in the traversal process:
when a file is visited, before a directory is accessed, after a directory is accessed, or when a failure occurs.

The interface has four methods that correspond to these situations:

- `postVisitDirectory` - Invoked for a directory after entries in the directory, and all of their descendants, have been visited.
- `preVisitDirectory` - Invoked for a directory before entries in the directory are visited.
- `visitFile` - Invoked for a file in a directory.
- `visitFileFailed` - Invoked for a file that could not be visited.


## Example: Recursive Listing of a Directory

`RecursiveListing.java`

```java

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

public class RecursiveListing {

  public static void main(String[] args) throws IOException {

    Path directory = Paths.get("src");

    Files.walkFileTree(directory, new SimpleFileVisitor<Path>() {

      @Override
      public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
        System.out.println(dir);
        return FileVisitResult.CONTINUE;
      }

      @Override
      public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
        System.out.println(file);
        return FileVisitResult.CONTINUE;
      }
    });
  }
}
```

The output should be something like:

```console
src
src\main
src\main\java
src\main\java\tests
src\main\java\tests\Frame.java
src\main\java\tests\HelloWorldSwing.java
src\main\java\tests\Metadata.java
src\main\java\tests\MetadataExample.java
src\main\java\tests\PassWordFrame.java
src\main\java\tests\RecursiveListing.java
src\main\java\tests2
src\main\java\tests2\Frame.java
src\main\resources
src\test
src\test\java
src\test\resources
```