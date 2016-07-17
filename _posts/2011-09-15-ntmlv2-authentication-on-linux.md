---
date: 2011-09-15 12:04:00
layout: post
author: Janne Haapsaari
comments: true
title: "NTMLv2 authentication on Linux"
categories:
    - NTLMv2
    - linux
cover:  "/assets/header_image.jpg"
---

Today at work I was trying to get my virtual machine, running Fedora, to
access internet. Unfortunately the place I work is pretty much married to
products from Microsoft. All the networking to the outside world go through
proxies and in this case through Microsoft ISA. ISA uses NTLMv2 authentication
mechanism which is not supported out of the box by Linux. Luckily there was
multiple applications that were able to act as a man in the middle proxy, such
as [cntlm](http://cntlm.sourceforge.net/) and
[NTLAMPS](http://ntlmaps.sourceforge.net/).

These proxies are installed locally and then applications will talk to them.
In turn these proxies will relay the requests to the actual proxy. This way we
can point our whole system to use this locally installed proxy and everything
just works. There are few applications, such as Firefox, that can authenticate
to NTLMv2 proxy but this is not the overall case.

I managed to get both of the replacement proxies working but ended up using
cntlm because it was way faster and required less system resources.
Nevertheless installation is easy for both of them since most distributions
provide packages for both of them. In this guide I will use Fedora but besides
the installation part, it should apply to other distributions as well.

1. Install cntlm

{% highlight sh %}
# yum install cntl
{% endhighlight %}

2. Test your authentication method

{% highlight sh %}
# cntlm -I -M http://www.google.fi
{% endhighlight %}

The command should output something like this:

{% highlight sh %}
----------------------------[ Profile 0 ]------
Auth NTLMv2
PassNTLMv2 DA95C27958430DESH829C0E38985484A
------------------------------------------------
{% endhighlight %}



3. Use this auth information in your /etc/cntlm.conf file.

{% highlight sh %}
Username        your_username
Domain          your_domain

Auth            NTLMv2
PassNTLMv2      DA95C27958430DESH829C0E38985484A

Proxy           your_proxy:your_proxy_port

# This is the port number where Cntlm will listen
Listen        3128
{% endhighlight %}

4. Configure your system to use the local proxy:

{% highlight sh %}
export http_proxy=http://localhost:3128
export https_proxy=http://localhost:3128
{% endhighlight %}

5. Start cntlm by executing:

{% highlight sh %}
# /etc/init.d/cntlmd start
{% endhighlight %}

If everything works, you should be able to access internet normally. Remember
you need to create new hash every time your password changes!

Also you might want to start cntlm automatically on start-up:

{% highlight sh %}
chkconfig --level 35 cntlmd on
{% endhighlight %}
