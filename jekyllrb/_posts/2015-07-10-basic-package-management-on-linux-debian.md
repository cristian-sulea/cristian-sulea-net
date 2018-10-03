---

layout: post

title:       "Basic Package Management on Linux Debian"
description: "Repository based package management operations on the Debian system can be performed by many APT-based package management tools (like apt-get and aptitude)."

categories: [linux, debian]
tags: [apt-get, apt-cache, aptitude]

resources:
  - "[http://www.debian.org/doc/manuals/debian-reference/ch02.en.html](http://www.debian.org/doc/manuals/debian-reference/ch02.en.html)"
  - "[http://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_basic_package_management_operations](http://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_basic_package_management_operations)"

---


Repository based package management operations on the Debian system can be performed by many APT-based package management tools available on the Debian system.

Basic package management tools:
- apt-get / apt-cache
- aptitude


## apt-get / apt-cache

The `apt-get` and `apt-cache` commands are the most basic APT-based package management tools.

- offer only the **command line user interface**;
- is most suitable for the **major system upgrade** between releases, etc;
- offers a **robust** package dependency resolver;
- is **less demanding** on hardware resources (it consumes less memory and runs faster);
- offers a **standard regex** based search on the package name and description;
- can manage multiple versions of packages using `/etc/apt/preferences` but it is quite cumbersome.


## aptitude

The `aptitude` command is the most versatile APT-based package management tool.

- offers the full screen **interactive text user interface**;
- offers the **command line user interface**, too;
- is most suitable for the **daily interactive package management** such as inspecting installed packages and searching available packages;
- is **more demanding** on hardware resources (it consumes more memory and runs slower);
- offers an **enhanced regex** based search on all of the package metadata;
- can manage multiple versions of packages without using `/etc/apt/preferences` and it is quite intuitive.


### Notable command options for aptitude

- `-s` simulate the result of the command
- `-d` download only but no install/upgrade
- `-D` show brief explanations before the automatic installations and removals


## Operations with the command line using apt-get / apt-cache and aptitude

update package archive metadata
- `apt-get update`
- `aptitude update`

install candidate version of "foo" package with its dependencies
- `apt-get install foo`
- `aptitude install foo`

install candidate version of installed packages without removing any other packages
- `apt-get upgrade`
- `aptitude safe-upgrade`

install candidate version of installed packages while removing other packages if needed
- `apt-get dist-upgrade`
- `aptitude full-upgrade`

remove "foo" package while leaving its configuration files
- `apt-get remove foo`
- `aptitude remove foo`

remove auto-installed packages which are no longer required
- `apt-get autoremove`

purge "foo" package with its configuration files
- `apt-get purge foo`
- `aptitude purge foo`

clear out the local repository of retrieved package files completely
- `apt-get clean`
- `aptitude clean`

clear out the local repository of retrieved package files for outdated packages
- `apt-get autoclean`
- `aptitude autoclean`

display detailed information about "foo" package
- `apt-cache show foo`
- `aptitude show foo`

search packages which match
- `apt-cache search <regex>`
- `aptitude search <regex>`

explain the reason why matching packages should be installed
- `aptitude why <regex>`

explain the reason why matching packages can not be installed
- `aptitude why-not <regex>`


{% include resources.html %}