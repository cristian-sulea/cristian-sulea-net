---

layout: post

title:       "Install Java (Oracle) on Linux Ubuntu"
description: "How to download and install Sun/Oracle's proprietary Java (Java Runtime Environment or Java Development Kit) in Ubuntu Linux distribution."

categories: [linux]
tags:       [java, ubuntu]

resources:
  - "[Ask Ubuntu (for JDK8)](http://askubuntu.com/questions/521145/how-to-install-oracle-java-on-ubuntu-14-04)"

---


Add partner repository:

```terminal
$ sudo apt-get purge openjdk*
```

Update the source list:

```terminal
$ sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
$ sudo apt-get update
$ sudo apt-get install sun-java6-jre sun-java6-plugin
```

Install Sun's Java packages:

```terminal
$ sudo update-alternatives -config java
```

Confirm that your system is configured properly for Sun's JRE (by checking the java version):

```terminal
$ java -version
```


## JDK 8

You can use [WebUpd8 PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/java) (this will download the required files from Oracle and install JDK 8):

```terminal
$ sudo apt-add-repository ppa:webupd8team/java
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
```

Also ensure your JAVA_HOME variable has been set to `/usr/lib/jvm/java-8-oracle`.

For this you can use the following command (see step 3 of Manual Install to see how to make it permanent):

```terminal
$ export JAVA_HOME=/usr/lib/jvm/java-8-oracle
```


{% include resources.html %}