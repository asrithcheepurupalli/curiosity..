// Generates a branded 1200x630 OG card per post into public/og/<slug>.png.
// Run from the repo root after adding or renaming posts:  node scripts/gen-og.mjs
// Requires rsvg-convert (librsvg) installed locally. The cards are committed as static
// assets, so the title shows on social shares without any build-time image pipeline.
import fs from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';

const POSTS = 'src/content/posts';
const OUT = 'public/og';
fs.mkdirSync(OUT, { recursive: true });

const esc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

function wrap(text, max) {
  const words = text.split(/\s+/);
  const lines = [];
  let line = '';
  for (const w of words) {
    if ((line + ' ' + w).trim().length > max && line) { lines.push(line); line = w; }
    else line = (line + ' ' + w).trim();
  }
  if (line) lines.push(line);
  return lines.slice(0, 4);
}

function card(title) {
  const lines = wrap(title, 26);
  const startY = 300 - (lines.length - 1) * 36;
  const tspans = lines
    .map((l, i) => `<tspan x="90" dy="${i === 0 ? 0 : 72}">${esc(l)}</tspan>`)
    .join('');
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 630">
  <rect width="1200" height="630" fill="#FAFAF7"/>
  <rect x="0" y="0" width="1200" height="8" fill="#2ECC71"/>
  <g transform="translate(90,64)">
    <circle cx="18" cy="18" r="14" fill="none" stroke="#111111" stroke-width="4"/>
    <circle cx="18" cy="18" r="5.5" fill="#2ECC71"/>
    <line x1="28" y1="28" x2="40" y2="40" stroke="#111111" stroke-width="4" stroke-linecap="round"/>
    <text x="58" y="28" font-family="monospace" font-size="30" font-weight="700" fill="#111111">curiosity<tspan fill="#2ECC71">.</tspan></text>
  </g>
  <text y="${startY}" font-family="sans-serif" font-size="58" font-weight="700" fill="#111111">${tspans}</text>
  <text x="90" y="565" font-family="monospace" font-size="24" letter-spacing="1.5" fill="#9a9a9a">curiosity.asrithcheepurupalli.tech</text>
</svg>`;
}

let n = 0;
for (const f of fs.readdirSync(POSTS).filter((x) => x.endsWith('.md'))) {
  const slug = f.replace(/\.md$/, '');
  const content = fs.readFileSync(path.join(POSTS, f), 'utf8');
  const title = (content.match(/^title:\s*"?(.*?)"?\s*$/m) || [])[1] || slug;
  execFileSync('rsvg-convert', ['-w', '1200', '-h', '630', '-o', path.join(OUT, `${slug}.png`)], { input: card(title) });
  n++;
}
console.log(`Generated ${n} per-post OG cards into ${OUT}/`);
