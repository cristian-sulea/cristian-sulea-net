---

layout: post

title:       "Install Java (OpenJDK) on Linux"
description: "How to download and install prebuilt OpenJDK packages (Java Runtime Environment or Java Development Kit) in various Linux distributions."

categories: [linux]
tags:       [java, openjdk, jdk]

resources:
  - "[OpenJDK: Download and Install](http://openjdk.java.net/install/)"
  - "[http://packages.debian.org/wheezy/openjdk-7-jdk](http://packages.debian.org/wheezy/openjdk-7-jdk)"

---


## Debian, Ubuntu, etc.

On the command line, type:

```terminal
$ sudo apt-get install openjdk-8-jre
```

The `openjdk-8-jre` package contains just the Java Runtime Environment.
If you want to develop Java programs then please install the `openjdk-8-jdk` package.


## Fedora, Oracle Linux, Red Hat Enterprise Linux, etc.

On the command line, type:

```terminal
$ su -c "yum install java-1.8.0-openjdk"
```

The `java-1.8.0-openjdk` package contains just the Java Runtime Environment.
If you want to develop Java programs then install the `java-1.8.0-openjdk-devel` package.


## JDK 7


### Debian, Ubuntu, etc.

On the command line, type:

```terminal
$ sudo apt-get install openjdk-7-jre
```

The `openjdk-7-jre` package contains just the Java Runtime Environment.
If you want to develop Java programs then install the `openjdk-7-jdk` package.


### Fedora, Oracle Linux, Red Hat Enterprise Linux, etc.

On the command line, type:

```terminal
$ su -c "yum install java-1.7.0-openjdk"
```

The `java-1.7.0-openjdk` package contains just the Java Runtime Environment.
If you want to develop Java programs then install the `java-1.7.0-openjdk-devel` package.


{% include resources.html %}