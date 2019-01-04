---

layout: post

title:       "How to Set Chrome As Default PDF Viewer"
description: "Right click on any PDF file, and select the 'Open with' item on the menu."

categories: [windows]
tags:       [chrome, pdf]

resources:
  - "[How-To Geek](http://www.howtogeek.com/howto/43764/how-to-enable-google-chrome-as-your-default-pdf-reader-the-easy-way/)"

---


Right click on any PDF file, and select the "Open with" item on the menu (if you don't see this, you can usually hold Shift and right-click, and it will be there).
This will bring up the "Open with" dialog, which lets you choose what to open your PDF files with.
If Google Chrome isn't listed, just click the "Browse" button.

> PDF file > Right click > Open with

[![PDF file > Right click > Open with]({{site.images}}{{page.url}}open-with.png)]({{site.images}}{{page.url}}open-with.png)

Don't forget to select the "Always use the selected program to open this kind of file" checkbox.*

If you know where Google Chrome was installed, then just browse to that location.
Otherwise, you can right click on the Chrome shortcut, head to "Properties", and then "Shortcut".
You'll see the location in the "Target" box (just to copy and paste the full path).

> Chrome shortcut > Right click > Properties > Shortcut

[![Chrome shortcut > Right click > Properties > Shortcut]({{site.images}}{{page.url}}google-chrome-location.png)]({{site.images}}{{page.url}}google-chrome-location.png)

Once you've selected "chrome.exe" and clicked the "OK" button, you're done.

If is not working open <a>chrome://plugins/</a> in Google Chrome and make sure that the "Chrome PDF Viewer" is enabled.

> `chrome://plugins/` > Chrome PDF Viewer > Enabled

[![chrome://plugins/ > Chrome PDF Viewer > Enabled]({{site.images}}{{page.url}}google-chrome-pdf-view.png)]({{site.images}}{{page.url}}google-chrome-pdf-view.png)
