---
layout: post
title:  "How to fix your damaged gnupg database"
author: Janne Haapsaari
date:   2015-01-02 11:18:14
category: gnupg
cover:  "/assets/header_image.jpg"
---
Some time ago I had troubles with my gnupg installation. Namely gpg was unable
to read keys from my trusted.db. I figured this had something to do with the
upgrade to GnuPG 2.1.0.

{% highlight sh %}
cd ~/.gnupg
mv pubring.gpg pubring-$USER.gpg
mv secring.gpg secring-$USER.gpg
mv trustdb.gpg trustdb-$USER.gpg
gpg --import pubring-$USER.gpg
gpg --import secring-$USER.gpg
rm pubring.$USER.gpg secring-$USER.gpg
rm trustdb.gpg
mv trustdb-cadw.gpg trustdb.gpg
{% endhighlight %}

That's all for now folks and happy new year!
