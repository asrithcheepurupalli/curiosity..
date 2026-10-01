import { defineCollection, z } from 'astro:content';

const posts = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.string(),
    readingTime: z.number(),
    description: z.string(),
    tags: z.array(z.string()).default([]),
    draft: z.boolean().default(false),
    // Pinned posts get the large "Special mention" card on the homepage.
    pinned: z.boolean().default(false),
    pinnedLabel: z.string().optional(),
    pinnedCta: z.object({ label: z.string(), href: z.string() }).optional(),
  }),
});

export const collections = { posts };
