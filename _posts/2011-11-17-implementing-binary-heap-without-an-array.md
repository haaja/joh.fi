---
layout: post
title: "Implementing binary heap without an array"
author: Janne Haapsaari
date: 2011-11-17 17:06:00
comments: true
categories:
    - Programming
    - Java
    - Binary Heap
cover:  "assets/header_image.jpg"
---

So I had this school assignment to implement a
[binary heap](http://en.wikipedia.org/wiki/Binary_heap) with a twist of not
using an array to store the binary tree. You might think that this is an easy
problem to solve and after some thinking it turns out that it isn't much
harder than the generic array implementation. However if this is the first
time you're implementing binary heap this way, you'll likely find it difficult
to insert new nodes in O(lg n) time. With arrays you can always find the last
element in constant time. Unfortunately this is not the case with object
references unless you have a trick or two in your sleeve. Once you're able t
access last node of the heap and sibling nodes of a particular node in
constant time, the solution is similar to any text book implementation. It is
also worth noting that at the time of writing [google](http://www.google.com)
isn't much of a help solving this problem because next to every example shows
the array implementation.

I solved the problem by adding all the node into a binary tree AND a doubly
linked list. Then I use the linked list to access last node of the heap and
siblings of an individual node. There might be other viable solutions as well
but this is by far the easiest I've heard of. As I'm lazy and can't be
bothered to draw pictures to further explain the solution. I pushed the source
code to a [github](https://github.com/haaja/data_structures) repository. The
original repository was a bit messy and in Finnish so no commit history for
you guys, sorry.
