---
date: 2011-10-03 18:45
author: Janne Haapsaari
layout: post
comments: true
title: "Unmounting a busy drive"
category: linux
cover:  "/assets/header_image.jpg"
---

My computer setup consists of
[Lenovo x220](https://www.lenovo.com/products/us/laptop/thinkpad/x-series/x220/)
with a docking station, two external screens and of course mouse and keyboard.
Even though my laptop has a fast hard drive, it has only 120GB disk space
which means I need external hard drives to store my data. I have one external
hard drive and one docking station which accepts regular internal 3.5" and
2.5" hard drives. Since I prefer suspend over shutdown I sometimes get
problems with my external docking station.

Usually the error is something like this:


```sh
# umount /media/storage1
umount: /media/storage1: device is busy
```


Luckily there is a great tool called
[fuser](https://secure.wikimedia.org/wikipedia/en/wiki/Fuser_%28Unix%29) which
lets you identify the process using a file or socket. This means that I can
easily find out which process is keeping my drive busy and simply kill the
process.

To find out which process is keeping your drive busy

```sh
# fuser -mv /dev/sdXY
/dev/sdc1: 6772
```

In the command letter X is the drive letter and letter Y is the number of
partition. The output gives the process id that prevents mounting/unmounting
the drive by using the resources. Even though fuser can kill the processes
using resources, it is generally safer to first find out what you going to
kill.

```sh
ps auxw|grep 6772
haaja 6772 0.4 2.7 219212 56792 ? SLl Oct 3 02:25 banshee
```

Here we can see that I have banshee open and still accessing media files on my
external hard drive. This was just a staged situation where I intentionally
left banshee open and dried unmounting. Usually I have some terminal tab still
open accessing the hard drive. I think that outputting the process information
should be the default behavior of umount in this type of error situations.
Kill the process and proceed to unmounting the no-longer-busy drive.
