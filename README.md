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
createdb foo
qbf -t foo
sql foo < your-insane.sql
```

It exposes II7 port (21071) to host 21072, so you can connect to it i.e. jdbc:ingres://localhost:21072/foo username: vagrant password: vagrant

Ideas and pull requests welcome.
