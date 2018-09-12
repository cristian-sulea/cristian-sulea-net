---

layout: post

date:        "2016-03-10"
title:       "Basic Linux Commands"
description: "A list with some basic (maybe most used) Linux commands, what they do and their syntax, and also some usage examples."

categories: linux commands

---


A list with some basic (maybe most used) Linux commands, what they do and their syntax, and also some usage examples.

- <a href="#passwd">Change Password</a>
- <a href="#hostname">Change Hostname</a>
- <a href="#ifconfig">Network Interfaces</a>
- <a href="#openssh-server">Install SSH Server</a>
- <a href="#maven">Install Maven</a>
- <a href="#jenkins">Install Jenkins</a>
- <a href="#dpkg">Package manager for Debian (dpkg command)</a>


## Change Password {#passwd}

```terminal
passwd
```

```terminal
passwd {userName}
```

Resources
- <a href="http://www.cyberciti.biz/faq/linux-change-password/">http://www.cyberciti.biz/faq/linux-change-password/</a>


## Change Hostname {#hostname}

```terminal
hostname
```

```terminal
nano /etc/hostname
nano /etc/hosts
reboot
```

Resources
- <a href="https://wiki.debian.org/HowTo/ChangeHostname">https://wiki.debian.org/HowTo/ChangeHostname</a>


## Network Interfaces {#ifconfig}

```terminal
ifconfig
```

```terminal
ifconfig eth0
```

Resources
- <a href="http://www.whatismyip.com/linux-ip-commands/">http://www.whatismyip.com/linux-ip-commands/</a>
- <a href="https://wiki.debian.org/NetworkConfiguration">https://wiki.debian.org/NetworkConfiguration</a>


## Install SSH Server {#openssh-server}

```terminal
apt-get install openssh-server
```

Resources
- <a href="https://wiki.debian.org/SSH">https://wiki.debian.org/SSH</a>


## Install Maven {#maven}

```terminal
apt-get install maven
```


## Install Jenkins {#jenkins}

```terminal
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins
```

Upgrade

```terminal
apt-get update
apt-get install jenkins
```

Resources
- <a href="https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu">https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu</a>


## Package manager for Debian (dpkg command) {#dpkg}

```terminal
dpkg --get-selections [package-name-pattern...]
```

```terminal
dpkg -L package-name
```

Get list of package selections, and write it to stdout.
Without a pattern, non-installed packages (i.e. those which have been previously purged) will not be shown.