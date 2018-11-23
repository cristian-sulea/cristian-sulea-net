---

layout: post

title:       "Install Proxy Server on Linux Debian (SQUID Web Proxy Cache)"
description: "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It runs also on Windows and is licensed under the GNU GPL."

categories: [linux]
tags:       [debian, proxy, squid]

resources:
  - "[http://www.squid-cache.org/](http://www.squid-cache.org/)"
  - "[http://wiki.squid-cache.org/SquidFaq/ConfiguringSquid](http://wiki.squid-cache.org/SquidFaq/ConfiguringSquid)"
  - "[http://wiki.squid-cache.org/Features/CacheHierarchy](http://wiki.squid-cache.org/Features/CacheHierarchy)"

---


[Squid] is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages.
[Squid] has extensive access controls and makes a great server accelerator.
It runs on most available operating systems, including Windows and is licensed under the GNU GPL.


## Install

```
apt-get install squid3
```

```
mv /etc/squid3/squid.conf /etc/squid3/squid.conf.original
nano /etc/squid3/squid.conf
```

*squid.conf*

```text
http_port 8080

acl all src all
http_access allow all

cache_peer 192.168.1.29 parent 8080 0 no-query default login=user:pass
never_direct allow all

maximum_object_size 40960 KB

#refresh_pattern .*\.(zip|rar|iso) 2880  0% 2880 override-expire
```


## Add a Disk Cache Directory

```text
cache_dir ufs /usr/local/squid/var/cache/squid 500 16 256
```

Windows

```text
cache_dir ufs c:/squid/var/cache 500 16 256
```


[Squid]: http://www.squid-cache.org
