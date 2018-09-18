---

layout: post

title:       "Install FTP Server on Linux Debian (vsftpd)"
description: "vsftpd is a GPL licensed FTP server for UNIX systems, including Linux. It is secure and extremely fast. It is stable."

categories: [linux]
tags:       [debian, ftp, vsftpd]

resources:
  - "[https://security.appspot.com/vsftpd.html](https://security.appspot.com/vsftpd.html)"
  - "[http://www.g-loaded.eu/2008/12/02/set-up-an-anonymous-ftp-server-with-vsftpd-in-less-than-a-minute/](http://www.g-loaded.eu/2008/12/02/set-up-an-anonymous-ftp-server-with-vsftpd-in-less-than-a-minute/)"
  - "[http://netpenthe.wordpress.com/2007/09/06/vsftpd-over-ssl/](http://netpenthe.wordpress.com/2007/09/06/vsftpd-over-ssl/)"

---


[vsftpd] is a GPL licensed FTP server for UNIX systems, including Linux.
It is secure and extremely fast. It is stable.


## Install

```
apt-get install vsftpd
```

```
mkdir -p /var/ftp
mkdir -p /var/ftp/incoming
chmod 777 /var/ftp/incoming
```

```
echo -e "Anonymous users can only write in \"incoming\" folder.\n" > /var/ftp/README.txt
```

```
mv /etc/vsftpd.conf /etc/vsftpd.conf.original
nano /etc/vsftpd.conf
```

*vsftpd.conf*

```ini
listen=YES

write_enable=YES

local_enable=NO
local_root=/home
chroot_local_user=YES

anonymous_enable=YES
anon_root=/var/ftp
anon_upload_enable=YES
anon_mkdir_write_enable=YES
anon_other_write_enable=YES
anon_umask=000

use_localtime=YES
```


## vsftpd over SSL

```ini
ssl_enable=YES
ssl_tlsv1=YES
ssl_sslv2=YES
ssl_sslv3=YES

rsa_cert_file=/etc/vsftpd/vsftpd.pem

force_local_data_ssl=YES
```


[vsftpd]: https://security.appspot.com/vsftpd.html


{% include resources.html %}