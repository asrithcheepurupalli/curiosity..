---
title: "What Happens When You Press Enter on a URL?"
date: "2024-08-22"
readingTime: 6
description: "The half-second between typing a web address and seeing a page is one of the most complex sequences in everyday computing."
---

## Observation

You type an address into your browser. You press Enter. A page appears. The whole thing takes less than a second, and you don't think about it at all.

You probably shouldn't have to. That's the point of good infrastructure. But what's happening in that half-second is a cascade of interdependent systems (each one having to succeed for the next to begin) that spans continents and involves dozens of servers you'll never know exist.

## Research

The sequence begins before your browser sends a single byte. First, it has to find out where to send them.

The address you typed, a domain name, is human-readable. Computers work with numbers. So your browser consults the DNS: the Domain Name System, a distributed global directory that maps names to IP addresses. Your operating system checks a local cache first. If it doesn't have the answer, it asks your router. If the router doesn't know, it asks your ISP's DNS server. If that fails, the query climbs up through a hierarchy of root servers until an authoritative answer comes back.

```
URL resolution chain:
browser cache → OS cache → router cache
  → ISP DNS → root nameserver → TLD nameserver
    → authoritative nameserver → IP address returned
```

Now your browser has an IP address. It opens a TCP connection, a handshake that confirms both sides are ready to communicate. If the site uses HTTPS (most do), a TLS handshake follows: certificates are exchanged, encryption keys are negotiated, identity is verified. Only then does your browser send the actual HTTP request.

The server receives it, generates a response, typically an HTML document, and sends it back. Your browser begins parsing the HTML before the full response even arrives. As it encounters references to stylesheets, scripts, and images, it fires off parallel requests for each one. The page renders incrementally, filling in as data arrives.

By the time you perceive the page as "loaded," your browser has likely made between 50 to 200 separate requests. A single press of Enter.

## Reflection

*We use the word "instant" to describe things we don't have to wait for. But instant is rarely empty: it's usually just very, very fast.*

*The web doesn't feel like a miracle because it was designed not to. The entire stack was engineered toward invisibility. When it works, you don't notice it. That invisibility is the achievement.*

End of Log
