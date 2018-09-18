---

layout: post

date:        "2014-10-26"
title:       "Portable SVN Repository"
description: "An easy way to transfer the code when developing on different systems is to use a flash drive (or a file hosting service) as a subversion (SVN) repository."

categories: [software development]
tags:       [svn, repository, portable]

---


An easy way to keep things in sync and transfer the code when developing on different systems is to use a flash drive (or a file hosting service, like [Dropbox] for example) as a subversion (SVN) repository.

To create the repository, run the `create` command in the portable device folder you want the repository:

```
svnadmin create repo-name
```

The repository location will be:

```
file://repo-path/repo-name
```

For example:

```
cd C:/Users/admin/SVN/
svnadmin create MyProject
```

Or:

```
svnadmin create C:/Users/admin/SVN/MyProject
```

And the repository location will be:

```
file://C:/Users/admin/SVN/MyProject
```

[Slik SVN] is a standalone command line Subversion package for Windows.
The installer contains all command line tools (`svn`, `svnadmin`, `svnsync`, `svnserve`, `svnmucc`, etc.) but no application bindings nor Apache modules.

The repository can be checked out from the portable device on any PC.
For example, [TortoiseSVN] can be used to checkout your portable repository and track changes on Windows.


[Dropbox]:     http://www.dropbox.com
[Slik SVN]:    http://www.sliksvn.com/en/download
[TortoiseSVN]: http://tortoisesvn.net