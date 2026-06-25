import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';
import type { APIContext } from 'astro';

export async function GET(context: APIContext) {
  const posts = (await getCollection('posts')).filter(
    p => !p.data.draft && new Date(p.data.date).getTime() <= Date.now()
  );

  posts.sort((a, b) => new Date(b.data.date).getTime() - new Date(a.data.date).getTime());

  return rss({
    title: 'Curiosity Log',
    description: 'Small questions about everyday things.',
    site: context.site ?? 'https://curiosity.asrithcheepurupalli.tech',
    stylesheet: '/rss.xsl',
    items: posts.map((post) => ({
      title: post.data.title,
      pubDate: new Date(post.data.date),
      description: post.data.description,
      link: `/posts/${post.slug}/`,
    })),
  });
}
