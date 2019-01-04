---

layout: post

title:       "Enable browser caching with .htaccess file"
description: "Optimize the site performance by enabling browser caching with .htaccess file."

category: [website]
tags:     [browser, cache, htaccess]

resources:
  - "[Apache Module: mod_expires](https://httpd.apache.org/docs/current/mod/mod_expires.html)"
  - "[bedigit blog](https://bedigit.com/blog/enabling-caching-and-gzip-compression-with-htaccess/)"

---


Using the `mod_expires` module, we can define how long each file type gets cached for after we’ve defined it’s MIME type.

This module controls the setting of the `Expires` HTTP header and the `max-age` directive of the `Cache-Control` HTTP header in server responses. The expiration date can set to be relative to either the time the source file was last modified, or to the time of the client access.

These HTTP headers are an instruction to the client about the document's validity and persistence. If cached, the document may be fetched from the cache rather than from the source until this time has passed. After that, the cache copy is considered "expired" and invalid, and a new copy must be obtained from the source.

`.htaccess`

```apache
# Enabling Browser Caching
<IfModule mod_expires.c>

  ExpiresActive on
  ExpiresDefault                                    "access plus 1 month"
  
  # DATA
  ExpiresByType text/html                           "access plus 0 seconds"
  ExpiresByType text/xml                            "access plus 0 seconds"
  ExpiresByType text/plain                          "access plus 0 seconds"
  ExpiresByType application/xml                     "access plus 0 seconds"
  ExpiresByType application/json                    "access plus 0 seconds"
  ExpiresByType application/ld+json                 "access plus 0 seconds"
  ExpiresByType application/vnd.geo+json            "access plus 0 seconds"
  ExpiresByType application/rss+xml                 "access plus 1 hour"
  ExpiresByType application/atom+xml                "access plus 1 hour"
  ExpiresByType text/x-component                    "access plus 1 hour"
  
  # SCRIPTS
  ExpiresByType text/css                            "access plus 1 month" 
  ExpiresByType text/javascript                     "access plus 1 month" 
  ExpiresByType application/javascript              "access plus 1 month" 
  ExpiresByType application/x-javascript            "access plus 1 month" 
  
  # IMAGES
  ExpiresByType image/gif                           "access plus 1 month"
  ExpiresByType image/png                           "access plus 1 month"
  ExpiresByType image/jpe                           "access plus 1 month"
  ExpiresByType image/jpg                           "access plus 1 month"
  ExpiresByType image/jpeg                          "access plus 1 month"
  ExpiresByType image/jp2                           "access plus 1 month"
  ExpiresByType image/pipeg                         "access plus 1 month"
  ExpiresByType image/bmp                           "access plus 1 month"
  ExpiresByType image/tiff                          "access plus 1 month"
  ExpiresByType image/svg+xml                       "access plus 1 month"
  ExpiresByType image/vnd.microsoft.icon            "access plus 1 month"
  
  # ICONS
  ExpiresByType image/ico                           "access plus 1 month"
  ExpiresByType image/icon                          "access plus 1 month"
  ExpiresByType text/ico                            "access plus 1 month"
  ExpiresByType image/x-ico                         "access plus 1 month"
  ExpiresByType image/x-icon                        "access plus 1 month"
  ExpiresByType application/ico                     "access plus 1 month"
  
  # AUDIO
  ExpiresByType audio/ogg                           "access plus 1 month"
  ExpiresByType audio/basic                         "access plus 1 month"
  ExpiresByType audio/mid                           "access plus 1 month"
  ExpiresByType audio/midi                          "access plus 1 month"
  ExpiresByType audio/mpeg                          "access plus 1 month"
  ExpiresByType audio/x-aiff                        "access plus 1 month"
  ExpiresByType audio/x-mpegurl                     "access plus 1 month"
  ExpiresByType audio/x-pn-realaudio                "access plus 1 month"
  ExpiresByType audio/x-wav                         "access plus 1 month"
  
  # VIDEO
  ExpiresByType video/ogg                           "access plus 1 month"
  ExpiresByType video/mp4                           "access plus 1 month"
  ExpiresByType video/webm                          "access plus 1 month"
  ExpiresByType video/x-msvideo                     "access plus 1 month"
  ExpiresByType video/mpeg                          "access plus 1 month"
  ExpiresByType video/quicktime                     "access plus 1 month"
  ExpiresByType video/x-la-asf                      "access plus 1 month"
  ExpiresByType video/x-ms-asf                      "access plus 1 month"
  ExpiresByType x-world/x-vrml                      "access plus 1 month"
  
  # FONTS
  ExpiresByType font/truetype                       "access plus 1 month"
  ExpiresByType font/opentype                       "access plus 1 month"
  ExpiresByType application/x-font-ttf              "access plus 1 month"
  ExpiresByType application/x-font-woff             "access plus 1 month"
  ExpiresByType application/font-woff               "access plus 1 month"
  ExpiresByType application/font-woff2              "access plus 1 month"
  ExpiresByType application/vnd.ms-fontobject       "access plus 1 month"
  
  # FLASH
  ExpiresByType application/x-shockwave-flash       "access plus 1 month"
  ExpiresByType video/x-flv                         "access plus 1 month"
  
  # MANIFEST
  ExpiresByType application/x-web-app-manifest+json "access plus 0 seconds"
  ExpiresByType text/cache-manifest                 "access plus 0 seconds"
  
  # OTHERS
  ExpiresByType application/pdf                     "access plus 1 month"
  ExpiresByType image/vnd.wap.wbmp                  "access plus 1 month"
  ExpiresByType application/vnd.wap.wbxml           "access plus 1 month"
  ExpiresByType application/smil                    "access plus 1 month"
  
  <IfModule mod_headers.c>
    Header append Cache-Control "public"
    <FilesMatch "\.(ico|flv|jpg|jpeg|png|gif|css|swf)$">
      Header set Cache-Control "max-age=2678400, public"
    </FilesMatch>
    <FilesMatch "\.(html|htm)$">
      Header set Cache-Control "max-age=7200, private, must-revalidate"
    </FilesMatch>
    <FilesMatch "\.(pdf)$">
      Header set Cache-Control "max-age=86400, public"
    </FilesMatch>
    <FilesMatch "\.(js)$">
      Header set Cache-Control "max-age=2678400, private"
    </FilesMatch>
  </IfModule>

</IfModule>
```

In the example above, you’ll see that some of the file types have "0 seconds" cache time. This is because some of the files shouldn’t be cached such as HTML and text any changes made to the copy on a website should be immediate, so we don’t cache them. Others like CSS and images will change less frequently, so we can cache them for longer periods of time.
