---

layout: post

title:       "Mount VirtualBox shared folders on Linux"
description: "A shared VirtualBox folder allows to easily share files between host OS and guest OS. This guide shows how to mount the VirtualBox shared folder on Linux."

categories: linux virtualbox

---


A shared VirtualBox folder allows to easily share files between host OS and guest OS. This guide shows how to mount the VirtualBox shared folder on Linux.

Define a shared folder:

```terminal
Temp
```

Create a folder where the shared folder will be mounted:

```terminal
mkdir ~/Temp
```

Mount it:

```terminal
mount -t vboxsf Temp ~/Temp
```

If you want to have it mount automatically upon each boot, put the mount command in `/etc/rc.local` (Debian based distro's),
or whatever script is run at the end of the boot process. When you put the mount command in `/etc/rc.local`,
so it's mounted at startup, you can't use the short notation for your home folder.

During startup, everything is done through the root user, so using `~` for home, means it's the home folder of Root (`/root`).
Change it to the full path.
For example:

```terminal
mount -t vboxsf Temp /home/<username>/Temp
```