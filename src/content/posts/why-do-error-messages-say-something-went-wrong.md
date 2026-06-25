---
title: "Why Do Error Messages Say 'Something Went Wrong'?"
date: "2025-02-01"
readingTime: 5
description: "The vaguest sentence in software is also, in a strange way, the most honest one."
---

## Observation

It appears at the worst moments. The form you spent ten minutes filling out. The payment that may or may not have gone through. The file you were trying to upload.

*Something went wrong.*

No code. No explanation. No suggestion of what to do next. Just those three words, passive and unhelpful, staring back at you.

It is, on its surface, a failure of communication. But look closer, and it reveals something true about the limits of software — and the strange challenge of writing text for machines.

## Research

The first impulse, when building software, is to show the real error. Catch the exception, display it. This seems honest. It is often a catastrophe.

Real error messages — the ones thrown by programming languages and servers — are written for developers, not users. They contain stack traces, variable names, internal paths, and technical descriptions that are meaningless to most people and potentially dangerous to expose publicly.

```
A real error (never show this to users):
  PostgresError: relation "user_sessions" does not exist
  at Object.query (/app/db/client.js:142:11)
  at async POST /api/auth/login

What users see instead:
  Something went wrong. Please try again.
```

Beyond legibility, there's a security concern. Detailed error messages reveal architecture. They tell an attacker which database you use, how your code is structured, sometimes even which versions of libraries you're running. A philosophy called *security through obscurity* argues that this information should be withheld — not because secrecy is sufficient protection, but because there's no reason to make attacks easier.

Then there's the problem of *accuracy*. Many errors are transient — a momentary network hiccup, a database that was briefly unreachable. Writing an error message that's specific enough to be useful without being so specific it's wrong when the error is actually something else is genuinely hard. "Something went wrong" is always true. It is the one thing you can always say.

Some companies have tried to do better. Good error messages identify what happened ("We couldn't save your changes"), what the user should do ("Try again in a few minutes"), and whether any action was taken ("No charges were made"). This is significantly harder to write than it sounds — it requires every possible failure mode to be anticipated and handled individually.

## Reflection

*"Something went wrong" is often laziness. But sometimes it is the truthful admission that a system — built from thousands of interacting parts, running on servers in buildings you've never seen, responding to inputs no one anticipated — has reached a state it cannot explain.*

*The machines are not always hiding from us. Sometimes they are just as confused as we are.*

— End of Log
