---
date: 2011-09-29 14:23:00
author: Janne Haapsaari
layout: post
comments: true
title: "Disabling URL trimming in Firefox 7"
category: firefox
cover:  "/assets/header_image.jpg"
---

Mozilla released
[Firefox 7](https://blog.mozilla.com/blog/2011/09/27/mozilla-firefox-significantly-reduces-memory-use-to-make-web-browsing-faster/)
released yesterday (actually day before yesterday since it's already 29th
here) and of course I did an upgrade as soon as RPM files were available in
[koji](http://koji.fedoraproject.org/koji/). Call me old fashioned but I
didn't like the new feature which trims the http:// part of URL. Perhaps it's
something that I'll eventually get used to but for now I disabled it. Luckily
disabling the feature was easy enough.

Here is how you do it:

{% highlight sh %}
    1. Open new tab and write about:config
    2. Search for option browser.urlbar.trimURL
    3. Set the value to false by double-clicking the option.
{% endhighlight %}

Yay, you're all set!
