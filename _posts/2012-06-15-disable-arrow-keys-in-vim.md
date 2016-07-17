---
date: 2012-06-15 10:24:00
layout: post
author: Janne Haapsaari
comments: true
title: "Disable arrow keys in Vim"
category: vim
cover:  "/assets/header_image.jpg"
---

I know this information can be found in n+1 other places but I will write it
here anyway to be able to access it easily later.

One of the most important things when starting to use Vim as your editor is
to drop all old habits! Therefore we will disable the arrow keys so that you
are forced to use h, j, k, l to navigate. So without further ado here are the
changes one should add to their .vimrc file.

{% highlight sh %}
noremap "
noremap!
noremap ""
noremap!
noremap ""
noremap!
noremap ""
noremap!
{% endhighlight %}


Happy viming!
