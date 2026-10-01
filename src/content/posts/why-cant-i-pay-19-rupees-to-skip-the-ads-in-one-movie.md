---
title: "Why Can't I Pay 19 Rupees to Skip the Ads in One Movie?"
date: "2026-10-01"
readingTime: 8
description: "Prime Video lets you pay to remove ads for a whole year. Nobody sells you a single quiet evening. The math says they should."
tags: ["technology", "money", "psychology", "interfaces"]
pinned: true
pinnedLabel: "An essay with a working prototype"
pinnedCta: { label: "Play the prototype", href: "/pass/" }
---

<figure class="ec-hero ec-wide"><div class="ec-scene" aria-hidden="true"><div class="ec-sun"></div><div class="ec-sea"></div><div class="ec-rain"></div><div class="ec-sub">"Meera, I should have said this at the station..."</div><span class="ec-ad"><b>Ad</b>2 of 3 · 0:24</span><span class="ec-chip"><i></i>No ads tonight · <em>₹19</em></span></div><figcaption>Saturday, 9:14 pm. The letter is about to be read. So is a detergent commercial.</figcaption></figure>

## Observation

It is a Saturday night. The lights are off, the popcorn is warm, and the movie I have been waiting all week to watch begins with an ad. Then another. A small button sits in the corner of the screen offering to make this go away. I press it, hoping. It takes me to a page asking for 699 rupees for a year of ad free Prime Video, or 129 rupees a month.

I do not want a year. I want tonight. I want two hours of a film without a detergent commercial landing in the middle of the saddest scene. And there is no way to buy just that. The choice is a year of silence or an evening of interruptions, with nothing in between.

## Research

Prime Video India started showing ads on 17 June 2025, after nine years without them. Amazon says to expect roughly four to six minutes of ads per hour. Removing them costs extra, on top of the 1,499 rupee Prime membership. Prime Lite members, who pay 799 a year, cannot remove ads at all.

<div class="ec-ladder"><div class="ec-tier"><span class="ec-k">Per year</span><b>₹699</b><span class="ec-s">Ad free add on</span></div><div class="ec-tier"><span class="ec-k">Per month</span><b>₹129</b><span class="ec-s">Ad free add on</span></div><div class="ec-tier ec-missing"><span class="ec-k">Tonight</span><b>₹19</b><span class="ec-s">Does not exist yet</span></div></div>

So what is one viewer actually worth to Amazon during one movie? A two hour film carries around ten minutes of ads, which is twenty or so slots. Trade reporting puts connected TV ad rates in India between about 200 rupees per thousand views for a ten second spot and 1,200 rupees for a sixty second one. Not every slot gets sold. Put it together and one person watching one movie on a TV earns Amazon somewhere around 4 to 15 rupees in ads, most likely near 8. On a phone it is closer to 3 to 5.

Now imagine a button that says: no ads for the next 24 hours, 19 rupees. After 18 percent GST, Amazon keeps about 16.

<div class="ec-compare"><span class="ec-k">What one viewer is worth, one movie night</span><div class="ec-row" style="margin-top:16px"><span class="ec-label">Ads in one movie, per viewer on a TV</span><b>~₹8</b><span class="ec-bar"><i style="--w:50%"></i></span></div><div class="ec-row ec-good"><span class="ec-label">One ₹19 pass, after 18% GST</span><b>~₹16</b><span class="ec-bar"><i style="--w:100%"></i></span></div><div class="ec-foot">Ads: about 20 slots, ₹200 to ₹1,200 per thousand views, roughly 60% of slots sold.</div></div>

<blockquote class="ec-pull">The pass is not a discount on the ad business. It beats it.</blockquote>

How much could it make? Amazon does not publish these numbers, so this is a sketch, not a forecast. Assume 30 million people watch Prime Video with ads each month in India, and each has two movie nights. That is 60 million moments where someone is staring at an ad with a remote in their hand.

<div class="ec-table-wrap"><table class="ec-table"><thead><tr><th>Buy the pass</th><th>Passes a month</th><th>Per year</th><th>After lost ads</th></tr></thead><tbody><tr><td>1%</td><td class="ec-num">0.6M</td><td class="ec-num">₹12 Cr</td><td class="ec-num ec-net">₹6 Cr<span class="ec-spark" style="--w:17%"></span></td></tr><tr><td>3%</td><td class="ec-num">1.8M</td><td class="ec-num">₹35 Cr</td><td class="ec-num ec-net">₹17 Cr<span class="ec-spark" style="--w:49%"></span></td></tr><tr><td>6%</td><td class="ec-num">3.6M</td><td class="ec-num">₹70 Cr</td><td class="ec-num ec-net">₹35 Cr<span class="ec-spark" style="--w:100%"></span></td></tr></tbody></table><div class="ec-foot">30M monthly ad tier viewers, two movie nights each, ₹16 kept per pass, ₹8 of ads given up per pass.</div></div>

For Amazon this is pocket change. But it is money from a group that currently pays nothing extra: people who will never commit 699 rupees up front but will happily spend 19 on a good night. India already runs on this logic. Shampoo comes in sachets. Data comes in ten and nineteen rupee packs. We are used to buying small.

The obvious worry is that this eats the ad business. If people pay to escape ads, do advertisers leave, budgets shrink, and the whole thing unravel? I do not think so. Even at a 6 percent take rate, the total ads shown drop by a few percent, which is noise to an advertiser. Amazon's real pitch to brands is that it can see whether an ad led to a purchase on Amazon, and that does not change. And ad free upgrades already exist in every market where Prime Video runs ads. Advertisers stayed.

There are two real risks, and both have fixes.

<div class="ec-risks"><div class="ec-risk"><span class="ec-k">Risk 01</span><b>The best viewers leave the ad audience</b><span class="ec-s">Pass buyers skew toward big TVs and spare money, exactly who advertisers pay most for. Lose too many and ad rates for everyone else slip.</span><span class="ec-fix">Keep the pass well above what those viewers earn in ads. ₹19 does. ₹29 leaves more room.</span></div><div class="ec-risk"><span class="ec-k">Risk 02</span><b>Light users drop the monthly plan</b><span class="ec-s">Anyone watching on fewer than seven days a month spends less on passes than on ₹129. Some will switch down.</span><span class="ec-fix">After the third pass, offer the year for ₹699 minus what they already spent. Every pass becomes a trial of the bigger plan.</span></div></div>

There is also a competitor problem. JioCinema once sold an entire month of ad free premium for 29 rupees. Against that, 19 rupees for a single day sounds expensive. So the pass cannot be pitched as cheap. It has to be pitched as tonight, uninterrupted.

So I built it, to see how it would feel.

<figure class="ec-proto ec-wide"><div class="ec-proto-bar"><span class="ec-live"></span><span>Interactive prototype</span><a href="/pass/" target="_blank" rel="noopener">Open full screen</a></div><div class="ec-proto-stage"><iframe src="/pass/?embed" title="Movie Night Pass, an interactive prototype" loading="lazy"></iframe></div><ol class="ec-steps"><li>Press play and wait for the ad to start.</li><li>Tap the green chip and pay ₹19. The movie comes back with no ads.</li><li>Turn on "3rd pass this month" and watch the pass become an offer for the year.</li></ol><figcaption>The film, the ads and the brands in it are made up. Not affiliated with any streaming service.</figcaption></figure>

## Reflection

*Most pricing assumes people are planners. Choose your plan, commit for a year, and live with it. But most of what we pay for comes from a mood, not a plan. I do not plan to hate ads. I hate them at 9:14 pm on a Saturday, right when the hero opens the letter, and that is exactly when I would pay.*

*The best price is often not the lowest one. It is the one that shows up at the right moment, in the right size. A business that only sells years leaves money on the table every single night.*

<div class="ec-notes"><span class="ec-k">Sources</span><ol><li><a href="https://www.afaqs.com/news/media/ads-are-coming-to-prime-video-india-unless-you-pay-rs-699-extra-9065973" target="_blank" rel="noopener">afaqs: Ads are coming to Prime Video India unless you pay ₹699 extra</a></li><li><a href="https://bestmediainfo.com/mediainfo/mediainfo-digital/prime-video-india-to-show-ads-from-june-17-ad-free-plan-starts-at-rs-129-9064163" target="_blank" rel="noopener">BestMediaInfo: Prime Video India to show ads from June 17</a></li><li><a href="https://www.exchange4media.com/digital-news/ott-platforms-and-the-changing-dynamics-of-ad-inventory-pricing-114930.html" target="_blank" rel="noopener">exchange4media: OTT platforms and the changing dynamics of ad inventory pricing</a></li><li><a href="https://money9.com/news/economy/jiocinema-reduces-premium-subscription-plan-price-to-less-than-%e2%82%b91-per-day-135738" target="_blank" rel="noopener">Money9: JioCinema premium plan at ₹29</a></li></ol></div>

End of Log
