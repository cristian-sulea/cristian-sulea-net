---

layout: post

title:       "Install Maven Repository on Linux Debian (Sonatype Nexus)"
description: "Instructions for installing and configuring Nexus Repository Manager as a service (so it starts back up after server reboots)."

categories: [linux]
tags:       [debian, maven, nexus]

resources:
  - "[https://www.sonatype.com/nexus-repository-oss](https://www.sonatype.com/nexus-repository-oss)"
  - "[http://www.sonatype.org/nexus/go](http://www.sonatype.org/nexus/go)"
  - "[http://books.sonatype.com/nexus-book/reference/install-sect-service.html](http://books.sonatype.com/nexus-book/reference/install-sect-service.html)"

---


When installing [Nexus Repository Manager] you should configure it to run as a service, so it starts back up after server reboots.
It is good practice to run that service or daemon as a specific user that has only the required access righs.

Create a `nexus` user with sufficient access rights to run the service:

```
adduser nexus
```

Download:

```
wget www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
tar -zxvf nexus-latest-bundle.tar.gz
ln -s nexus-x.x.x-xx nexus
```

Copy `$NEXUS_HOME/bin/nexus` to `/etc/init.d/nexus` and make it executable:

```
cp /home/nexus/nexus/bin/nexus /etc/init.d/nexus
chmod 755 /etc/init.d/nexus
```

Edit the script (`nano /etc/init.d/nexus`) and change the following variables:

```ini
NEXUS_HOME="/home/nexus/nexus"
RUN_AS_USER=nexus
PIDDIR="/home/nexus"
```

Set up the repository manager as a service:

```
cd /etc/init.d
update-rc.d nexus defaults
service nexus start
```


## Everything Put Together

```
adduser nexus

wget www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
tar -zxvf nexus-latest-bundle.tar.gz
ln -s nexus-x.x.x-xx nexus

cp /home/nexus/nexus/bin/nexus /etc/init.d/nexus
chmod 755 /etc/init.d/nexus

nano /etc/init.d/nexus
> NEXUS_HOME="/home/nexus/nexus"
> RUN_AS_USER=nexus
> PIDDIR="/home/nexus"

cd /etc/init.d
update-rc.d nexus defaults
service nexus start
```

[Nexus Repository Manager]: https://www.sonatype.com/nexus-repository-oss
