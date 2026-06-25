<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="/rss/channel/title"/> — RSS Feed</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:ital,wght@0,400;0,700;1,400&amp;family=Inter:wght@300;400;500&amp;display=swap" rel="stylesheet"/>
        <style>
          *, *::before, *::after {{ box-sizing: border-box; margin: 0; padding: 0; }}

          :root {{
            --bg: #FAFAF7;
            --text: #111111;
            --text-muted: #666666;
            --divider: #E5E5E5;
            --accent: #2ECC71;
            --accent-dim: rgba(46, 204, 113, 0.12);
            --font-mono: 'Space Mono', monospace;
            --font-body: 'Inter', sans-serif;
          }}

          @media (prefers-color-scheme: dark) {{
            :root {{
              --bg: #0F0F10;
              --text: #E5E5E5;
              --text-muted: #888888;
              --divider: #2A2A2A;
              --accent: #2ECC71;
              --accent-dim: rgba(46, 204, 113, 0.08);
            }}
          }}

          html {{ font-size: 16px; scroll-behavior: smooth; }}

          body {{
            background-color: var(--bg);
            color: var(--text);
            font-family: var(--font-body);
            font-weight: 400;
            line-height: 1.7;
            -webkit-font-smoothing: antialiased;
            min-height: 100vh;
          }}

          a {{ color: inherit; text-decoration: none; }}

          .site-header {{
            position: sticky;
            top: 0;
            z-index: 100;
            background: var(--bg);
            border-bottom: 1px solid var(--divider);
          }}

          .header-inner {{
            max-width: 856px;
            margin: 0 auto;
            padding: 0 24px;
            height: 56px;
            display: flex;
            align-items: center;
            justify-content: space-between;
          }}

          .logo {{
            font-family: var(--font-mono);
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 0.02em;
            color: var(--text);
            text-decoration: none;
          }}

          .logo-period {{ color: var(--accent); }}

          .header-badge {{
            font-family: var(--font-mono);
            font-size: 0.65rem;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--text-muted);
            border: 1px solid var(--divider);
            padding: 4px 10px;
            border-radius: 2px;
          }}

          .container {{
            max-width: 760px;
            margin: 0 auto;
            padding: 0 24px;
          }}

          .feed-header {{
            padding: 64px 0 48px;
            border-bottom: 1px solid var(--divider);
            margin-bottom: 0;
          }}

          .feed-label {{
            font-family: var(--font-mono);
            font-size: 0.65rem;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--accent);
            margin-bottom: 16px;
            display: block;
          }}

          .feed-title {{
            font-family: var(--font-mono);
            font-size: 2rem;
            font-weight: 700;
            color: var(--text);
            line-height: 1.2;
            margin-bottom: 12px;
          }}

          .feed-description {{
            font-size: 1rem;
            color: var(--text-muted);
            line-height: 1.7;
            max-width: 520px;
            margin-bottom: 28px;
          }}

          .feed-meta {{
            display: flex;
            gap: 24px;
            flex-wrap: wrap;
          }}

          .feed-meta-item {{
            font-family: var(--font-mono);
            font-size: 0.7rem;
            letter-spacing: 0.08em;
            color: var(--text-muted);
          }}

          .feed-meta-item a {{
            color: var(--accent);
            border-bottom: 1px solid transparent;
            transition: border-color 0.2s;
          }}

          .feed-meta-item a:hover {{ border-color: var(--accent); }}

          .subscribe-box {{
            margin-top: 28px;
            padding: 20px 24px;
            border: 1px solid var(--divider);
            background: var(--accent-dim);
            border-left: 3px solid var(--accent);
          }}

          .subscribe-box p {{
            font-size: 0.875rem;
            color: var(--text-muted);
            line-height: 1.6;
          }}

          .subscribe-box strong {{
            font-family: var(--font-mono);
            font-size: 0.7rem;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text);
            display: block;
            margin-bottom: 6px;
          }}

          .posts-list {{
            list-style: none;
          }}

          .post-item {{
            border-bottom: 1px solid var(--divider);
            padding: 36px 0;
          }}

          .post-item:last-child {{ border-bottom: none; }}

          .post-date {{
            font-family: var(--font-mono);
            font-size: 0.65rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--text-muted);
            margin-bottom: 10px;
            display: block;
          }}

          .post-title {{
            font-family: var(--font-mono);
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text);
            line-height: 1.35;
            margin-bottom: 10px;
          }}

          .post-title a {{
            transition: color 0.2s;
          }}

          .post-title a:hover {{ color: var(--accent); }}

          .post-description {{
            font-size: 0.9rem;
            color: var(--text-muted);
            line-height: 1.7;
            max-width: 600px;
          }}

          .post-link {{
            display: inline-block;
            margin-top: 14px;
            font-family: var(--font-mono);
            font-size: 0.65rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--accent);
            border-bottom: 1px solid transparent;
            transition: border-color 0.2s;
          }}

          .post-link:hover {{ border-color: var(--accent); }}

          .site-footer {{
            border-top: 1px solid var(--divider);
            padding: 32px 0;
            margin-top: 64px;
          }}

          .footer-inner {{
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
          }}

          .footer-copy {{
            font-family: var(--font-mono);
            font-size: 0.65rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--text-muted);
          }}

          .footer-back {{
            font-family: var(--font-mono);
            font-size: 0.65rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--accent);
            border-bottom: 1px solid transparent;
            transition: border-color 0.2s;
          }}

          .footer-back:hover {{ border-color: var(--accent); }}

          @media (max-width: 600px) {{
            .feed-title {{ font-size: 1.5rem; }}
            .feed-header {{ padding: 40px 0 32px; }}
          }}
        </style>
      </head>
      <body>
        <header class="site-header">
          <div class="header-inner">
            <a href="/" class="logo">
              curiosity<span class="logo-period">.</span>
            </a>
            <span class="header-badge">RSS Feed</span>
          </div>
        </header>

        <div class="container">
          <div class="feed-header">
            <span class="feed-label">Live Feed</span>
            <h1 class="feed-title"><xsl:value-of select="/rss/channel/title"/></h1>
            <p class="feed-description"><xsl:value-of select="/rss/channel/description"/></p>
            <div class="feed-meta">
              <span class="feed-meta-item">
                Feed URL: <a><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/>/rss.xml</xsl:attribute>/rss.xml</a>
              </span>
              <span class="feed-meta-item">
                <xsl:value-of select="count(/rss/channel/item)"/> posts
              </span>
            </div>
            <div class="subscribe-box">
              <strong>How to subscribe</strong>
              <p>Copy the feed URL above and paste it into any RSS reader — Reeder, NetNewsWire, Feedly, or any other reader you prefer.</p>
            </div>
          </div>

          <ul class="posts-list">
            <xsl:for-each select="/rss/channel/item">
              <li class="post-item">
                <span class="post-date"><xsl:value-of select="pubDate"/></span>
                <h2 class="post-title">
                  <a>
                    <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                    <xsl:value-of select="title"/>
                  </a>
                </h2>
                <p class="post-description"><xsl:value-of select="description"/></p>
                <a class="post-link">
                  <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                  Read post →
                </a>
              </li>
            </xsl:for-each>
          </ul>
        </div>

        <footer class="site-footer">
          <div class="container">
            <div class="footer-inner">
              <span class="footer-copy">&#169; Curiosity Log</span>
              <a href="/" class="footer-back">&#8592; Back to site</a>
            </div>
          </div>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
