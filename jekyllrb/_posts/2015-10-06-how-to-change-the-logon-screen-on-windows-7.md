---

layout: post

title:       "How to Change the Logon Screen on Windows 7"
description: "It is possible to change the welcome screen that appears when you start your computer also without any third-party software, but this setting is well hidden."

categories: [logon screen, logon, windows 7, windows]

---


Windows 7 makes it possible to change the welcome screen that appears when you start your computer without any third-party software, but this setting is well hidden.


## Enabling Custom Backgrounds

This feature is disabled by default, so you'll have to enable it from the Registry Editor.

Launch the Registry Editor and navigate to the following key:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background
```

[![How to Change the Logon Screen on Windows 7 (1)]({{site.images}}{{page.url}}how-to-change-the-logon-screen-on-windows-7-1.png)]({{site.images}}{{page.url}}how-to-change-the-logon-screen-on-windows-7-1.png)

You'll see an `DWORD` value named `OEMBackground`.
If you don't see it, right-click in the right pane, point to the "New" submenu and create a new DWORD value with this name.
Double-click the `OEMBackground` value and set its value to `1`.

[![How to Change the Logon Screen on Windows 7 (2)]({{site.images}}{{page.url}}how-to-change-the-logon-screen-on-windows-7-2.png)]({{site.images}}{{page.url}}how-to-change-the-logon-screen-on-windows-7-2.png)


## Setting An Image

Your image file must be less than `256 KB` in size.
It's also a good idea to use an image file that matches the resolution of your monitor, so it won't look stretched.

Windows looks for the custom logon screen background image in the following directory:

```
C:\Windows\System32\oobe\info\backgrounds
```

Copy your desired background image to the backgrounds folder and name it `backgroundDefault.jpg`.

[![How to Change the Logon Screen on Windows 7 (3)]({{site.images}}{{page.url}}how-to-change-the-logon-screen-on-windows-7-3.png)]({{site.images}}{{page.url}}how-to-change-the-logon-screen-on-windows-7-3.png)