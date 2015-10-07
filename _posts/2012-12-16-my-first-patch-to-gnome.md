---
layout: post
title: "My first patch to GNOME"
author: Janne Haapsaari
date: 2012-12-16 19:22:00
comments: true
categories: "gnome, linux, open source, programming"
cover:  "assets/header_image.jpg"
---

I've used open source software for many years now but I haven't really
contributed back to any of the open source communities. I have filled some
bug reports but other than that I've been simply a happy (and sometimes less
happy) user. However yesterday I took the first step by doing tiny tiny
contribution to [GNOME](http://www.gnome.org) or to be specific to
gnome-session. The funny thing is that it was all because of selfish reasons.

I was writing my script called [osinfo](https://github.com/haaja/osinfo) and
found out that gnome-session gave exit value 1 when called with --version
argument. This was easily tested doing the following.

{% highlight sh %}
[haaja@jarvis ~]$ gnome-session --version
gnome-session 3.6.2
[haaja@jarvis ~]$ echo $?
1
{% endhighlight %}

Exit value 1 with non-error cases is problematic because usually exit values
other than 0 are interpreted as an error. This was also the case with
[Python's](http://www.python.org/) subprocess module and specifically its
check_output function.

Since I knew that this was trivial to fix I thought that I might just as well
fix it. The problem was that I had never before contributed to GNOME so I had
no clue how and where to send patches. Luckily after some help from google and
I was directed to their bugzilla. ~~Unfortunately GNOME documentation isn't
the easiest for the beginner because they are quite dated and I really didn't
want setup IRC client to join their IRC channels and ask for help.~~ So I
spent most of the time browsing their bugzilla and reading git logs to
determine conventions used for commit messages and bug reports.

EDIT: I finally did find the documentation
[Contributing patches](https://live.gnome.org/Git/Developers#Contributing_patches).

Finally I created a [bug report](https://bugzilla.gnome.org/show_bug.cgi?id=690273)
and attached a patch for the bug. Few minutes later one of the developers
reviewed my patch and a while later I received email that my patch was
[committed](http://git.gnome.org/browse/gnome-session/commit/?id=f18652d38f5b739dbb2086c5e6fe9629a0a49295)
to the master branch. Everything went smoothly and surprisingly fast so I
might just do this again next time I find something that bothers me in GNOME.
