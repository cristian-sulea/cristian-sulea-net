---

layout: post

date:        "2014-03-04"
title:       "Linux - Set up HTTP proxy for GNU Wget (wget)"
description: "To make GNU Wget (wget command) work behind a proxy, 'wgetrc' (which is found in '/etc/' directory) file must be edited."

categories: linux wget proxy ]

---


To make GNU Wget (`wget` command) work behind a proxy, `wgetrc` (which is found in `/etc/` directory) file must be edited.

Open `wgetrc` file with preferred editor:

{% highlight bash %}
nano /etc/wgetrc
{% endhighlight %}

And add a new line with the proxy settings (or update if the line is already present):

{% highlight properties %}
http_proxy = http://user:password@server:port/
{% endhighlight %}


## Protect the proxy settings

By removing READ permissions for "all other users":

{% highlight bash %}
stat /etc/wgetrc
chmod 640 /etc/wgetrc
{% endhighlight %}