---

layout: post

date:        "2014-10-16"
title:       "Install Eclipse on Linux Ubuntu"
description: "The recommended way to install Eclipse on Ubuntu is using the distribution's package manager, but the Ubuntu distribution contains a very old version."

categories: [linux]
tags:       [ubuntu, eclipse]

---


Extract the eclipse download and move to opt:

```
tar xvzf eclipse*.tar.gz
sudo mv eclipse /opt/eclipse
```

Then create an eclipse executable in your path:

```
sudo touch /usr/bin/eclipse
sudo chmod 755 /usr/bin/eclipse
sudo gedit /usr/bin/eclipse
```

with this contents:

```sh
#!/bin/sh
export ECLIPSE_HOME="/opt/eclipse"
$ECLIPSE_HOME/eclipse $*
```

Then create a gnome menu item:

```
sudoedit /usr/share/applications/eclipse.desktop
```

with this contents:

```ini
[Desktop Entry]

Encoding=UTF-8
Name=Eclipse
Comment=Eclipse IDE
Exec=eclipse
Icon=/opt/eclipse/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
```

You now have a working eclipse, but run this command first to initialise the set up:

```
/opt/eclipse/eclipse -clean
```