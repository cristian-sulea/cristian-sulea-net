---

layout: post

date:        "2015-07-02"
title:       "DokuWiki URL Rewriting in Apache"
description: "By default, DokuWiki does no URL rewriting, resulting ugly URLs (http://server.com/doku.php?id=page) and not indexed well."

categories: [software development]
tags:       [dokuwiki, htaccess, apache]

resources:
  - "[https://www.dokuwiki.org/rewrite](https://www.dokuwiki.org/rewrite)"

---


By default, [DokuWiki] does no URL rewriting, resulting in URLs like this:

```
http://example.com/doku.php?id=page
```

These URLs are considered ugly and are not indexed well by some search engines.

Rewriting URLs in Apache is done through the `mod_rewrite` module of [Apache 1] or [Apache 2].
The module is enabled in `httpd.conf` with the following line (make sure it is not commented out):

```apache
LoadModule rewrite_module modules/mod_rewrite.so
```

On many kinds of Linux (Ubuntu, Debian, etc) you may enable `mod_rewrite` with:

```
sudo a2enmod rewrite
```

The setup of module mod_rewrite is done through so-called **rewrite rules**, which can be either defined directly in the server's main config or in a `.htaccess` file located in DokuWiki's main directory.
DokuWiki comes with an `.htaccess.dist` file which contains the needed rewrite rules for mode 1, but commented.
Just copy the file to `.htaccess` (in the folder that contains `doku.php`, caveat Debian users) and uncomment the lines to enable rewriting.

In Debian 6 at least you do not have to copy anything. `/usr/share/dokuwiki/.htaccess` links to `/etc/dokuwiki/htaccess`. So there is no caveat anymore.

`.htaccess`

```apache
RewriteEngine on

RewriteBase /dokuwiki

RewriteRule ^_media/(.*)              lib/exe/fetch.php?media=$1  [QSA,L]
RewriteRule ^_detail/(.*)             lib/exe/detail.php?media=$1  [QSA,L]
RewriteRule ^_export/([^/]+)/(.*)     doku.php?do=export_$1&id=$2  [QSA,L]
RewriteRule ^$                        doku.php  [L]
RewriteCond %{REQUEST_FILENAME}       !-f
RewriteCond %{REQUEST_FILENAME}       !-d
RewriteRule (.*)                      doku.php?id=$1  [QSA,L]
RewriteRule ^index.php$               doku.php
```

Remember to set following in the Configuration Manager (`/start?do=admin&page=config`)

- Use nice URLs: `.htaccess` (use find, it's far down)
- Use slash as namespace separator in URLs [**x**]

otherwise rewrite rules will not be useful.


[DokuWiki]: https://www.dokuwiki.org
[Apache 1]: http://httpd.apache.org/docs/1.3/mod/mod_rewrite.html
[Apache 2]: http://httpd.apache.org/docs/2.0/mod/mod_rewrite.html


{% include resources.html %}