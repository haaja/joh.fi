---
title:  "How to fix your damaged gnupg database"
author: Janne Haapsaari
date:   2015-01-02 11:18:14
categories:
    - gnupg
---
Some time ago I had troubles with my gnupg installation. Namely gpg was unable
to read keys from my trustdb.gpg. I figured this had something to do with the
upgrade to GnuPG 2.1.0.

```sh
cd ~/.gnupg
mv pubring.gpg pubring-$USER.gpg
mv secring.gpg secring-$USER.gpg
mv trustdb.gpg trustdb-$USER.gpg
gpg --import pubring-$USER.gpg
gpg --import secring-$USER.gpg
rm pubring-$USER.gpg secring-$USER.gpg
rm trustdb.gpg
mv trustdb-$USER.gpg trustdb.gpg
```

That's all for now folks and happy new year!
