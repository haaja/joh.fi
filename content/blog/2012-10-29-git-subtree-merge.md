---
layout: post
title: "Git subtree merge"
author: Janne Haapsaari
date: 2012-10-29 18:31:00
comments: true
category: git
cover:  "/assets/header_image.jpg"
---

Last week I took part to an intensive
[Clojure-course](http://iloveponies.github.com/) which was an introduction to
functional programming using [Clojure](http://clojure.org/). The course itself
was fairly well organized and interesting but that's not the topic of this
post.

The course was built around solving small programming tasks using clojure.
Each topic had their own separate git repository on
[github](http://www.github.com) which we cloned and added our solutions in.
The end result was that participants had many repositories (one for each
exercise set) and this was fine during the course. Now that I've successfully
passed the course I wanted to get rid of all the separate repositories and
combine them to a single git repository. I could have simply created a new
repository and copied the files into it but this way I would have lost all
commit history. I have previously used git submodules but since I won't be
developing these assignments further I would rather not user that method. Few
minutes of googling and I found a solution for my problem,
[git subtree merge](http://git-scm.com/book/ch6-7.html).
Subtree merge is perfect for my use case since I my repositories were separate
but they shared no data with each other. In other words there would not be any
merge conflicts.

Here is a quick tutorial of the steps that I did.

First I created a new folder called Clojure and two subdirectories called
exercises and material.

```sh
$ tree Clojure/
Clojure/
├── exercises
└── material
```

Then I initialized an empty git repository to the Clojure directory.

```sh
$ cd Clojure/ && git init
```

Next I created a subdirectory which I will use as a prefix to a following
merge.

```sh
mkdir exercises/old_project
```

Now it was just a matter of adding the old repository as a remote repository
to our newly created main repository.

```sh
git remote add -f old_project http://www.example.com/repo/old_project.git
```

Then do the merge without doing the actual commit.

```sh
git merge -s ours --no-commit old_project/master
```

Next we actually add the old_project repository to our new repository. This
happens with git read-tree command which reads the master tree of the
old_project repository and stores it under the path given with prefi
argument.

```sh
git read-tree --prefix=exercises/old_project -u old_project/master
```

Now we are almost done. Final step is to actually do the commit.

```sh
git commit -m "Merged old_project repository to Clojure repository"
```

In my case I had multiple repositories so I just repeated those steps for
every repository I wanted to combine. My final repository structure looks like
the one below.

```sh
$ tree -d Clojure/
Clojure/
├── exercises
│   ├── blorg
│   │   ├── src
│   │   │   └── blorg
│   │   └── test
│   │       └── blorg
│   ├── i-am-a-horse-in-the-land-of-booleans
│   │   ├── src
│   │   └── test
│   ├── looping-is-recursion
│   │   ├── src
│   │   └── test
│   ├── one-function-to-rule-them-all
│   │   ├── doc
│   │   ├── src
│   │   └── test
│   ├── p-p-p-pokerface
│   │   ├── src
│   │   └── test
│   ├── predicates
│   │   ├── src
│   │   └── test
│   ├── recursion
│   │   ├── src
│   │   └── test
│   ├── structured-data
│   │   ├── src
│   │   └── test
│   ├── sudoku
│   │   ├── src
│   │   │   └── sudoku
│   │   └── test
│   │       └── sudoku
│   └── training-day
│       ├── src
│       ├── target
│       │   ├── classes
│       │   └── stale
│       └── test
└── material
    └── 120-hour-epic-sax-marathon
            ├── bin
                    ├── css
                            └── img
```

The first level subdirectories below exercise and material directories were
originally separate git repositories. Now I have one single repository that
contains the data of all the old repositories which I can easily push to
github.
