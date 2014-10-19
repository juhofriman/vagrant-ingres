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
-bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory
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
