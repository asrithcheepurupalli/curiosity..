---
title: "Why Do Computers Start Counting From 0?"
date: "2023-11-02"
readingTime: 6
description: "The origin of zero-based indexing, and what it reveals about the boundary between human intuition and machine logic."
tags: ["technology", "numbers", "history", "science"]
---

## Observation

In the physical world, we begin with one. A single apple, a first step. Yet in the digital realm, the void itself is assigned a coordinate. Zero is not just nothing; it is the beginning of everything.

Watch a programmer write a loop, or an engineer define an array. The index always starts at the origin. This departure from human intuition (starting at 1) to machine logic (starting at 0) defines the boundary between the natural and the synthetic.

## Research

Historically, this convention stems from memory addressing. In early computing, an array's index was treated as an *offset* from the starting point in memory.

```
// Pointer logic
Memory Address = Base + (Index × Size)
```

If you start at index 1, you must perform a subtraction to find the address of the first element. By starting at 0, the first element is located exactly at the base address. In the resource-constrained days of the 1960s, saving a single subtraction operation across millions of cycles was not just an optimization; it was a necessity.

Edsger W. Dijkstra, the renowned computer scientist, later argued that zero-based indexing is mathematically more elegant for representing ranges, reducing the occurrence of "off-by-one" errors in range calculations.

```python
# A range of n items: [0, n)
# The count of items in range [a, b) is simply b - a
# Clean. No fences to count, only posts.
items = [0, 1, 2, 3, 4]  # length 5, indices 0 through 4
```

Some languages (MATLAB, Lua, Fortran, R) chose 1-based indexing, reflecting their origins in mathematical notation and scientific computing where the first element of a series is naturally indexed as 1. The debate between communities persists to this day.

## Reflection

*Perhaps there is a Zen-like truth in starting from zero. It reminds us that before the first object exists, the space for it must be acknowledged. In code, as in meditation, we must first recognize the emptiness before we can define the form.*

*Zero is not the absence of something. Zero is the precondition for everything.*

End of Log
