# Echo

An AI assistant for business websites. It reads a company's site, answers visitors' questions 24/7 in their language using only that content, and forwards qualified leads (name, email, need).

- `server/index.tsx`: single-file Bun server (demo creation, chat API, embeddable widget, pages)
- `site/index.html`: bilingual FR/EN showcase site (served from the `echo_config` table, key `html`)
- `supabase/tables.sql`: database schema

## How it works

1. `POST /api/demo {url}` reads the home page plus up to 3 key pages (SSRF protected: http/https only, private and metadata IPs blocked, redirects re-checked, size and time limits).
2. `POST /api/chat {site, messages}` answers with Claude Haiku from that content only; site text is treated as untrusted data.
3. `/widget.js` is an embeddable chat bubble: `<script src="https://YOUR-HOST/widget.js" data-site="SITE_ID" async></script>`

## Run

```
cp .env.example .env   # fill in the values
bun run server/index.tsx
```

Requires an Anthropic API key and a Supabase project (run `supabase/tables.sql`).
