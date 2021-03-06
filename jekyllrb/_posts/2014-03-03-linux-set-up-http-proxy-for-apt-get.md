---

layout: post

title:       "Linux - Set up HTTP proxy for APT (apt-get)"
description: "To make APT (apt-get command) work behind a proxy, 'apt.conf' (which is found in '/etc/apt/' directory) file must be edited."

categories: [linux]
tags:       [proxy, apt-get]

resources:
  - "[https://wiki.debian.org/AptConf](https://wiki.debian.org/AptConf)"
  - "[https://help.ubuntu.com/community/AptGet/Howto](https://help.ubuntu.com/community/AptGet/Howto)"
  - "[http://www.unixmen.com/configure-debian-squeeze-to-work-behind-a-proxy-faqs/](http://www.unixmen.com/configure-debian-squeeze-to-work-behind-a-proxy-faqs/)"

---


To make APT (`apt-get` command) work behind a proxy, `apt.conf` (which is found in `/etc/apt/` directory) file must be edited.

Open `apt.conf` file with preferred editor:

```terminal
nano /etc/apt/apt.conf
```

And add a new line with the proxy settings (or update if the line is already present):

```
Acquire::http::Proxy "http://user:password@server:port/";
```


## Protect the proxy settings

By removing READ permissions for "all other users":

```terminal
stat /etc/apt/apt.conf
chmod 640 /etc/apt/apt.conf
```
