---

layout: post

title:       "Install Google Chrome on Linux Fedora"
description: "Best way to install and keep up-to-date with Google Chrome browser is to use Google's own YUM repository."

categories: [linux]
tags:       [chrome, fedora]

---


Best way to install and keep up-to-date with Google Chrome browser is to use Google's own YUM repository.


## 1. Enable Google YUM repository

Add following to `/etc/yum.repos.d/google.repo` file:

- 32-bit systems

```ini
[google-chrome]
name=google-chrome - 32-bit
baseurl=http://dl.google.com/linux/chrome/rpm/stable/i386
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```

- 64-bit systems

```ini
[google-chrome]
name=google-chrome - 64-bit
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```


## 2. Install Google Chrome with YUM

Install Google Chrome stable version:

```bash
yum install google-chrome-stable
```

Install Google Chrome beta version:

```bash
yum install google-chrome-beta
```

Install Google Chrome unstable version:

```bash
yum install google-chrome-unstable
```