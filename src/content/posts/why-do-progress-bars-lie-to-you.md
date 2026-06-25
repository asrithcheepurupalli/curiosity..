---
title: "Why Do Progress Bars Lie To You?"
date: "2027-05-24"
readingTime: 2
description: "A download bar races to ninety percent, then crawls, and we wait inside a number that was never quite telling us the truth."
tags: ["interfaces", "technology", "design", "psychology"]
---

## Observation

The file begins to download. The bar fills with satisfying speed, ten, forty, eighty, ninety percent in a handful of seconds. Then it stops. Not entirely, but it slows to a crawl, the final sliver inching forward while the seconds stretch.

You have seen this a thousand times. The installer that sits at ninety nine percent longer than it took to reach ninety nine. The loading screen that promises "almost done" and then quietly reconsiders.

The bar is not measuring your patience, yet it seems to test it precisely where it hurts most. So what is the bar actually counting, and why does it so often count wrong?

## Research

A progress bar can only be honest about work it can measure. Copying a file of known size is easy: bytes moved divided by bytes total. But most tasks are not like that. Installing software unpacks archives, writes registry entries, checks dependencies, and waits on a disk whose speed nobody can predict. The program does not know how long these steps take until it is inside them, so it estimates, and estimates drift.

This is the problem of the indeterminate task. When a process cannot count its remaining work, it often counts something easier instead, like the number of steps completed rather than their duration. If step nine of ten happens to be the slow one, the bar sprints to ninety and then stalls. The number was always describing tasks, not time.

There is also a deliberate softer reason. Research into perceived duration, much of it building on work by Chris Harrison and colleagues at Carnegie Mellon around 2007 to 2010, found that the shape of a progress bar changes how long the wait feels, even when the real wait is identical. Bars that accelerate toward the end feel faster than bars that slow down. A pause early on is forgiven; a pause near the finish is not. So some designers tune the animation to behave kindly, front loading the visible progress and smoothing the final stretch, which can make a bar that technically lies feel more truthful to the body waiting in front of it.

And sometimes the bar simply has nothing left to report. The work is happening on a distant server, or in a process that gives no feedback, so the bar keeps moving on a timer to reassure you it has not frozen. At that point it is not a measurement at all. It is a heartbeat.

## Reflection

*A progress bar is a promise made with incomplete information, the way most promises are. It tells you not where you are but where someone hoped you would be by now.*

*Perhaps that is why the stall at ninety percent feels so familiar. We have all sprinted through the easy part of something and then met the quiet, uncounted work near the end, the part no bar could ever have known to measure.*

End of Log
