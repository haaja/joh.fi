---
date: 2012-07-09 15:21:00
author: Janne Haapsaari
layout: post
comments: true
title: "KDE and ssh-agent"
categories:
    - kde
    - ssh
    - linux
cover:  "assets/header_image.jpg"
---

Hello lazyweb!

[GNOME](http://www.gnome.org/) or to be more precise
[GNOME keyring](http://live.gnome.org/GnomeKeyring) has nice feature of
including ssh-agent that integrates nicely with gnome-keyring. I find this
feature very convenient since I don't have to input my password every time I
connect to a server. (I sincerely hope that no one is using ssh-keys without
password protection).

Things are quite not as convenient on [KDE](http://kde.org/) side of desktop
environments even though KDE provides handy tool called
[KDE wallet](http://utils.kde.org/projects/kwalletmanager/). Luckily with few
simple scripts we can use the combination of KDE wallet and ssh-agent to
provide similar functionality on KDE. So without further ado here is the
guide.

1. Open your favorite text editor and create file ~/.kde/env/ssh-agent.sh.
Add following lines into file and save it.

{% highlight sh %}
#!/bin/bash
eval `ssh-agent`
{% endhighlight %}



2. Create file ~/.kde/Autostart/ssh-add.sh and add following lines.

{% highlight sh %}
#!/bin/bash
export SSH_ASKPASS=/usr/bin/ksshaskpass
/usr/bin/ssh-add
{% endhighlight %}

3. Create file ~/.kde/shutdown/ssh-agent.sh and add following lines.

{% highlight sh %}
#!/bin/bash
eval `ssh-agent -k`
{% endhighlight %}

4. As a last step you need to give execute rights for the scripts that we just
created.

{% highlight sh %}
chmod +x ~/.kde/env/ssh-agent.sh
chmod +x ~/.kde/Autostart/ssh-add.sh
chmod +x ~/.kde/shutdown/ssh-agent.sh
{% endhighlight %}

That's it! Now simply log out and log back in and notice how kde-wallet will
prompt for password and also your ssh-key password will be asked. In case you
want check the "remember this password" option and your ssh-key password will
be remembered by kde-wallet. One could argue that this type of functionality
should be on default KDE installation but then again it wasn't too hard to
achieve this way either.
