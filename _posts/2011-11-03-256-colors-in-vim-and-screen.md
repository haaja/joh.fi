---
date: 2011-11-03 14:44:00
author: Janne Haapsaari
layout: post
comments: true
title: "256 colors in vim and screen"
categories:
    - vim
    - screen
    - linux
cover:  "assets/header_image.jpg"
---

For some strange reason at least [Fedora](http://fedoraproject.org/) ships
[screen](http://www.gnu.org/s/screen/) and [vim](http://www.vim.org/) with
256 colors disabled. Here's a quick guide how to enable 256 colors in vim and
screen.

1. Add to you .vimrc file

{% highlight sh %}
set t_Co=256
{% endhighlight %}


2. Add following lines to your .screenrc file

{% highlight sh %}
attrcolor b ".I"
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
defbce "on"
{% endhighlight %}


Also check that your terminal supports or has 256 colors enabled. At least
gnome-terminals seems to have this by default. Enjoy combination of vim and
screen with 256 colors. :)
