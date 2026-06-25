# curiosity

Small questions about everyday things. A minimalist inquiry into the mechanics of the ordinary.

Live at **[curiosity.asrithcheepurupalli.tech](https://curiosity.asrithcheepurupalli.tech)**.

Built with [Astro](https://astro.build). Posts are Markdown in a content collection. Each
one follows the same shape: a question, explored through **Observation**, **Research**, and
**Reflection**, signed off with "End of Log".

## Writing style

- One ordinary question per post, answered with real history, science, or psychology.
- Three sections: `## Observation`, `## Research`, `## Reflection` (reflection in italics).
- No em dashes or en dashes anywhere. Use commas, periods, colons, or "to" for ranges.
- Roughly 450 to 650 words.

## Scheduled publishing

Posts are written ahead of time with future dates and publish on their own.

- A post is hidden until its `date` arrives. The date filter lives in `src/pages/index.astro`,
  `src/pages/posts/[slug].astro`, and `src/pages/rss.xml.ts`.
- A GitHub Action (`.github/workflows/scheduled-build.yml`) pings a Netlify build hook every
  morning, so the site rebuilds and reveals any post that has come due. No manual deploy.
- Setup is a one-time Netlify build hook stored as the GitHub secret `NETLIFY_BUILD_HOOK`.

## Post frontmatter

```yaml
---
title: "Why Do Clocks Go Clockwise?"
date: "2026-09-14"        # future date = scheduled, hidden until then
readingTime: 5
description: "One vivid sentence for search results and social cards."
tags: ["time", "history", "measurement"]
draft: false
---
```

## Structure

```text
public/            favicon, og image, robots.txt, rss stylesheet
src/
  content/posts/   the posts (Markdown)
  layouts/         Layout.astro (head, meta, header, footer)
  pages/           index, about, 404, posts/[slug], tags, rss.xml
  styles/          global.css
```

## Commands

| Command           | Action                                  |
| :---------------- | :-------------------------------------- |
| `npm install`     | Install dependencies                    |
| `npm run dev`     | Local dev server at `localhost:4321`    |
| `npm run build`   | Build the production site to `./dist/`  |
| `npm run preview` | Preview the build locally               |
| `npm run og`      | Regenerate per-post social cards         |

## Social cards

Each post has its own Open Graph image (its title on a branded card) under `public/og/`.
They are committed as static assets. After adding or renaming posts, run `npm run og` to
regenerate them (needs `rsvg-convert` / librsvg installed locally). Pages that are not posts
use the default `public/og-image.png`.

## Deploy

Hosted on Netlify, continuously deployed from the `main` branch. Pushing to `main` triggers a
build. DNS for the domain runs on Netlify DNS.
