---

layout: post

date:        "2014-01-14"
title:       "Disable browser caching with meta HTML tags"
description: "The minimum set of HTML headers to disable browser caching that works across the most important browsers: Cache-Control, Pragma, Expires."

categories: browser cache html

resources:
  - "[http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9)"
  - "[http://stackoverflow.com/a/2068407](http://stackoverflow.com/a/2068407)"

---


The correct minimum set of headers that works across the most important browsers:
{% highlight properties %}
Cache-Control: no-cache, no-store, must-revalidate
Pragma: no-cache
Expires: 0
{% endhighlight %}

Where:
- `Cache-Control` is for <strong>HTTP 1.1</strong>
- `Pragma` is for <strong>HTTP 1.0</strong>
- `Expires` is for <strong>proxies</strong>


## Web Pages (HTML)

For the Web Pages (HTML) add the following `<meta>` tags to the page(s) you want
to keep browsers from caching (the code must be in the `<head>` section of your page,
for example right after `<title>` tag):

{% highlight html %}
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
{% endhighlight %}


## .htaccess (Apache)

{% highlight apache %}
<IfModule mod_headers.c>
  Header set Cache-Control "no-cache, no-store, must-revalidate"
  Header set Pragma "no-cache"
  Header set Expires 0
</IfModule>
{% endhighlight %}


## Java Servlet

{% highlight java %}
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
{% endhighlight %}


## PHP

{% highlight php %}
header('Cache-Control: no-cache, no-store, must-revalidate');
header('Pragma: no-cache');
header('Expires: 0');
{% endhighlight %}


## ASP

{% highlight actionscript %}
Response.addHeader "Cache-Control", "no-cache, no-store, must-revalidate"
Response.addHeader "Pragma", "no-cache"
Response.addHeader "Expires", "0"
{% endhighlight %}

## ASP.NET

{% highlight actionscript %}
Response.AppendHeader("Cache-Control", "no-cache, no-store, must-revalidate");
Response.AppendHeader("Pragma", "no-cache");
Response.AppendHeader("Expires", "0");
{% endhighlight %}

## Ruby on Rails

{% highlight ruby %}
response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
response.headers['Pragma'] = 'no-cache'
response.headers['Expires'] = '0'
{% endhighlight %}

## Python on Flask

{% highlight python %}
resp.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
resp.headers["Pragma"] = "no-cache"
resp.headers["Expires"] = "0"
{% endhighlight %}

## Google Go

{% highlight go %}
responseWriter.Header().Set("Cache-Control", "no-cache, no-store, must-revalidate")
responseWriter.Header().Set("Pragma", "no-cache")
responseWriter.Header().Set("Expires", "0")
{% endhighlight %}


{% include resources.html %}
