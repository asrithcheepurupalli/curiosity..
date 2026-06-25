---
title: "What Is a Loading Spinner Really Doing?"
date: "2024-12-14"
readingTime: 5
description: "That spinning circle on your screen isn't showing you progress. It's managing your patience."
---

## Observation

You've watched thousands of them. The rotating circle. The pulsing bar. The bouncing dots. Somewhere between clicking a button and getting a result, a small animation appears to tell you: something is happening.

But is it? And does the spinner actually know?

## Research

There are two kinds of loading indicators, and they represent fundamentally different things.

The first is a *determinate* indicator: a progress bar that fills from 0% to 100%. This requires the system to actually know how much work remains — file size, total records, steps in a pipeline. The bar's position is a real measurement.

The second — and far more common — is an *indeterminate* indicator: the spinner. It has no information about progress. It simply rotates. It is not tracking anything. It is a signal that says "I have not crashed, and I am still trying."

```
Determinate  → system knows remaining work → progress bar
Indeterminate → system does not know        → spinner / pulse
```

The spinner exists because of a real problem in user psychology. Studies on perceived wait time — beginning with research in the 1990s on elevator door-close buttons — consistently show that *visible activity* during a wait makes the wait feel shorter. A blank screen feels longer than a spinning one, even if the actual duration is identical.

The animation is not informational. It's therapeutic.

Some teams discovered the inverse of this: that a progress bar that moves quickly to 90% and then stalls feels *worse* than a spinner that never claimed to know anything. False precision is more frustrating than honest uncertainty.

The best loading experiences often add just a little more: a message that changes every few seconds ("Fetching your data..." → "Almost there..." → "Just a moment..."). This works not because it's accurate, but because it mimics a person who's keeping you updated — and that social contract, however simulated, makes waiting tolerable.

## Reflection

*The spinner is a small white lie in the service of a better experience. It claims movement when movement may be happening elsewhere, or not yet, or already finished and just awaiting a render.*

*But perhaps that's fine. The spinner isn't for the server. It's for the person watching.*

*And sometimes that's the entire job.*

— End of Log
