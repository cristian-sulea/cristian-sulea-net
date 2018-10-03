---

layout: post

title:       "Install Google Chrome on Linux Ubuntu"
description: "Best way to install is to add the Google Chrome PPA to repository and to install using the 'apt-get' command."

categories: [linux]
tags:       [chrome, ubuntu]

---


Best way to install is to add the Google Chrome PPA to repository and to install using the [apt-get](http://manpages.debian.org/cgi-bin/man.cgi?query=apt-get) command.


## 1. Enable Google Apt-Get repository

Add Linux repository public key from Google:

```terminal
$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```

When added, run the command below:

```terminal
$ sudo gedit /etc/apt/sources.list.d/google.list
```

Then copy and paste the line below into the file and save:

```text
$ deb http://dl.google.com/linux/chrome/deb/ stable main
```

After saving the file, run the commands below to update your system:

```terminal
$ sudo apt-get update
```

Or:

```terminal
$ sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
```


## 2. Install Google Chrome with Apt-Get

Install Google Chrome stable version:

```terminal
$ sudo apt-get install google-chrome-stable
```

Install Google Chrome beta version:

```terminal
$ sudo apt-get install google-chrome-beta
```

Install Google Chrome unstable version:

```terminal
$ sudo apt-get install google-chrome-unstable
```