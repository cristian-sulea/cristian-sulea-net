---

layout: post

date:        "2014-04-14"
title:       "Linux - Mount a CD-ROM or DVD"
description: "How to create CD and DVD mount points in Linux (common CD mount points are /cdrom and /mnt/cdrom and common DVD mount points are /dvdrom and /mnt/dvdrom)."

categories: [mount, linux]

---


Common CD mount points are `/cdrom` and `/mnt/cdrom` and common DVD mount points are `/dvdrom` and `/mnt/dvdrom`.

If the mount point does not exist, create it:

```terminal
mkdir /mnt/cdrom
```

Mount it:

```terminal
mount -t iso9660 -o ro /dev/cdrom /mnt/cdrom
```

If you cannot mount because

> the device is already mounted or directory busy

perhaps the mount point `/mnt/cdrom` is your current directory. You have to change the directory to somewhere else in order to be able to mount to it.


## Unmount and eject

Exit the directory `/mnt/cdrom` and execute:

```terminal
umount /mnt/cdrom
eject
```

Or simply run:

```terminal
eject
```

If you are unable to unmount your previously mounted CD-ROM, make sure that you are not in the directory where your CD-ROM is mounted or that some other application is not using it.

If you are still having problems to unmount your CD-ROM medium you can use `fuser` command to kill all related processes using your device.

```terminal
fuser -mk /dev/hdc
eject
```

Never use the above command on devices mounted read/write unless you are sure what you are doing.