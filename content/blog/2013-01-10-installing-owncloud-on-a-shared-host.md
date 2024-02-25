---
title: Installing ownCloud on a shared host
author: Janne Haapsaari
date: 2013-01-10 18:45:00
categories:
    - owncloud
    - kapsi
cover:  "/assets/header_image.jpg"
---

I've been using [Dropbox](https://www.dropbox.com/) and
[Google Calendar](https://www.google.com/calendar/) for as long as I can
remember and I've rarely had any problems with them. As a matter of a fact
both products work great, offer free service and have saved my ass on few
occasions. Sounds too good? Yeah... The old truth still stands: If you're not
paying for it; You're the product (and sometimes even if you're paying). The
part of me that is concerned about privacy issues has never liked the
situation but I've argued that the benefits are greater than lack of privacy.
Also lately I've been syncing more files to my Dropbox and my free disk quota
is running out. Therefore I need to either find a better alternative or start
paying for the service. Well yesteday I had some free time on my hands and
decided to look for an alternative to Dropbox. Ideal replacement should be
easy to use, work well and preferably be open souce. It didn't take me long to
bump into [ownCloud](http://owncloud.org/).

At first sight ownCloud looked great: nice user inteface, open source, media
streaming, suppot for applications and most importantly solid enough to have
[multiple companies offering services using
ownCloud](http://owncloud.org/providers/). Let's take ownCloud into a test as
I happen to have some extra [web space](http://www.kapsi.fi). I have to say
though that ownCloud uses the word *cloud* pretty vaguely as by default
ownCloud is installed on one server and the support for external storage is
only an experimental feature.

Installation itself was pretty straightforward. I simply downloaded the latest
ownCloud from their [install page](http://owncloud.org/support/install/) and
extracted it on my server. Next I navigated to `<myserver>/owncloud/` and
created the admin user. Everything went smoothly and I thought that the
installation was successful as I managed to import my calendar and contacts
from google and create files and folders with the web ui. However when I tried
to configure desktop sync client to work with my ownCloud installation, things
didn't go as planned. The sync client accepted my credentials during the
initial setup but complained that credentials were invalid when ever it tried
to sync.

To make WebDAV work I had to edit the .htaccess file in the installation
directory.

I changed the existing

```sh
<IfModule mod_rewrite.c>
RewriteEngine on
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteRule ^.well-known/host-meta /public.php?service=host-meta [QSA,L]
RewriteRule ^.well-known/carddav /remote.php/carddav/ [R]
RewriteRule ^.well-known/caldav /remote.php/caldav/ [R]
RewriteRule ^apps/([^/]*)/(.*\.(css|php))$ index.php?app=$1&getfile=$2
[QSA,L]
RewriteRule ^remote/(.*) remote.php [QSA,L]
</IfModule>
```

To

```sh
<IfModule mod_rewrite.c>
RewriteEngine on
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization},L]
RewriteRule ^.well-known/host-meta /public.php?service=host-meta [QSA,L]
RewriteRule ^.well-known/carddav /remote.php/carddav/ [R]
RewriteRule ^.well-known/caldav /remote.php/caldav/ [R]
RewriteRule ^apps/([^/]*)/(.*\.(css|php))$ index.php?app=$1&getfile=$2
[QSA,L]
RewriteRule ^remote/(.*) remote.php [QSA,L]
</IfModule>
```

Spotting the difference is left as an exercise. :D Nah, just kidding it's the
HTTP_AUTHORIZATION line and the added ,L at the end.

One problem solved but then apache started complaining about permissions.

```sh
[Thu Jan 10 23:51:14 2013] [error] [client xx.xxx.xxx.xxx] client denied
by server configuration: <INSTALL_DIR>/owncloud/remote.php
```


As as solution I added to the .htaccess file following lines.

```sh
Order allow,deny
Allow from all
```

Voilá and the sync client managed to synchronize everything.

Next step is to configure my desktop and mobile calendar, email client and
mobile phone for contacts and of course sync client to synchronize everything
important. I have to test ownCloud for few months until I'm confident enought
to ditch my current solutions but so far everything looks great.
