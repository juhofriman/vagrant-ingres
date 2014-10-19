vagrant-ingres
==============

It's a Vagrant-box with Ingres community edition database installed. Unfortunaly you have to acquire rpm-package from somewhere - I was unable to find direct link from anywhere.

## Howto ##

Download and install Vagrant. Get ingres rpm from somewhere and place it to `place-ingres-here`. I used ingres-10.1.0-125-gpl-linux-x86_64.tgz.

```
vagrant up
```

```
vagrant ssh
```

```
Host:vagrant-ingres juho$ vagrant ssh
Last login: Sun Oct 19 12:08:39 2014 from 10.0.2.2
[vagrant@localhost ~]$ 
[vagrant@localhost ~]$ createdb foo
...
[vagrant@localhost ~]$ qbf -t foo
...
[vagrant@localhost ~]$ sql foo < your-insane.sql
...
```

It exposes II7 port (21071) to host 21072, so you can connect to it i.e. jdbc:ingres://localhost:21072/foo username: **vagrant** password: **vagrant** (Seems to work, eventhough vagrant is NOPASSWORD)

Ideas and pull requests welcome.

### Become ingres user ###

You can configure system by becoming ingres user.

```
[vagrant@localhost ~]$ sudo su -
[root@localhost ~]# su - ingres
[ingres@localhost ~]$ ls -la /opt/Ingres/IngresII/ingres/
total 68
drwxr-xr-x. 16 ingres ingres 4096 Oct 19 12:52 .
drwxr-xr-x.  3 root   root   4096 Oct 19 12:51 ..
drwxrwxrwx.  2 ingres ingres 4096 Oct 19 12:52 abf
drwxr-xr-x.  2 ingres ingres 4096 Oct 19 12:51 bin
drwx------.  3 ingres ingres 4096 Oct 19 12:51 ckp
drwx------.  3 ingres ingres 4096 Oct 19 12:51 data
drwxr-xr-x.  5 ingres ingres 4096 Oct 19 12:51 demo
drwx------.  3 ingres ingres 4096 Oct 19 12:51 dmp
drwxr-xr-x. 16 ingres ingres 4096 Oct 19 12:52 files
drwx------.  3 ingres ingres 4096 Oct 19 12:51 jnl
drwxr-xr-x.  2 ingres ingres 4096 Oct 19 12:52 lib
drwx------.  2 ingres ingres 4096 Oct 19 12:51 log
drwxr-xr-x.  9 ingres ingres 4096 Oct 19 12:51 sig
drwxr-xr-x.  2 ingres ingres 4096 Oct 19 12:51 utility
drwxr-xr-x.  2 ingres ingres 4096 Oct 19 12:51 vdba
-rw-r--r--.  1 ingres ingres   27 Sep 25  2012 version.rel
drwx------.  3 ingres ingres 4096 Oct 19 12:51 work
```

Happy configuring!
