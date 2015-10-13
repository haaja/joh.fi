---
date: 2011-10-03 18:31
author: Janne Haapsaari
layout: post
comments: true
title: "Spotify 0.6.1 on Fedora 15/16"
categories:
    - linux
    - fedora
    - spotify
cover:  "assets/header_image.jpg"
---

Edit: This works for version 0.6.2 as well.

[Spotify](http://www.spotify.com/) is a popular music streaming service which
unfortunately isn't globally available. Here in Finland we have had the
opportunity to enjoy Spotify from the begining which is a rare thing. For a
minuscule amount of 9.99€ you'll have pretty much unlimited collection of
music at your hands and on your mobile phone. Ok, granted not every artist has
their music in Spotify but the collection is huge! Better yet they "support"
Linux with their preview client. The support is nothing compared to Windows or
OS X but it's more than most services ever offer. While the service is
certainly rewarding for the end-user, I've heard stories about artists
complaining that the money coming from Spotify is next to nothing. Personally
I don't know what real situation is, probably record labels are taking most
of the money. Enough said, lets get our hands dirty.

Spotify used to have separate packages for
[Fedora](https://fedoraproject.org/), but currently the repository is empty.
This is a minor annoyance and with little work we can use the packages they
provide for [Debian](http://www.debian.org/).

Download the packages from the apt repository.

{% highlight sh %}
$ wget http://repository.spotify.com/pool/non-free/s/spotify/spotify-client-gnome-support_0.5.2.84.g6d797eb-1_all.deb
$ wget http://repository.spotify.com/pool/non-free/s/spotify/spotify-client-qt_0.6.1.309.gb871a7d-1_amd64.deb
{% endhighlight %}



deb packages are ar archives which we can easily open (note that it is ar not
tar ;) ).

{% highlight sh %}
$ ar vx spotify-client-gnome-support_0.5.2.84.g6d797eb-1_all.deb
{% endhighlight %}

Both packages have similar content so extract them into different directories
or follow this guide for one package at a time. Following files should be
extracted: contor.tar.gz, data.tar.gz and debian-binary. data.tar.gz file
contains the files we need to make Spotify work on fedora.

This step will require root privileges. Copy data.tar.gz into system root, cd
yourself to root, extract the data.tar.gz and finally remove the data.tar.gz
file.

{% highlight sh %}
# cp data.tar.gz /
# cd /
# tar -xzvf data.tar.gz
# rm data.tar.gz
{% endhighlight %}

Repeat the procedure for the spotify-client as well.

Now you can try to execute spotify from command line and it should fail to
launch with following errors. You only get the first error until spotify can
successfully find libssl.so, but to save time I've listed both errors here. On
a side note ldd is a great tool for finding out dynamic library dependencies.

{% highlight sh %}
spotify: error while loading shared libraries: libssl.so.0.9.8: cannot open shared object file: No such file or directory
spotify: error while loading shared libraries: libcrypto.so.0.9.8: cannot open shared object file: No such file or directory
{% endhighlight %}


Fedora uses newer versions of openssl and Spotify does not check the version
of the library correctly. First make sure you have openssl-devel package
installed and then help spotify to find libssl.so by creating a symbolic link
to the correct path depending on your architecture.

{% highlight sh %}
# This is for 64 bit installations
ln -s /usr/lib64/libssl.so /usr/lib64/libssl.so.0.9.8
ln -s /usr/lib64/libcrypto.so /usr/lib64/libcrypto.so.0.9.8

# This is for 32 bit installations
ln -s /usr/lib/libssl.so /usr/lib/libssl.so.0.9.8
ln -s /usr/lib/libcrypto.so /usr/lib/libcrypto.so.0.9.8
{% endhighlight %}

Now you should be able to start Spotify and enjoy some great music with native
linux client!
