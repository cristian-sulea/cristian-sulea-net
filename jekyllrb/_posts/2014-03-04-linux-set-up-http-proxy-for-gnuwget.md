---

layout: post

title:       "Linux - Set up HTTP proxy for GNU Wget (wget)"
description: "To make GNU Wget (wget command) work behind a proxy, 'wgetrc' (which is found in '/etc/' directory) file must be edited."

categories: linux wget proxy

---


To make GNU Wget (`wget` command) work behind a proxy, `wgetrc` (which is found in `/etc/` directory) file must be edited.

Open `wgetrc` file with preferred editor:

```terminal
nano /etc/wgetrc
```

And add a new line with the proxy settings (or update if the line is already present):

```
http_proxy = http://user:password@server:port/
```


## Protect the proxy settings

By removing READ permissions for "all other users":

```terminal
stat /etc/wgetrc
chmod 640 /etc/wgetrc
```