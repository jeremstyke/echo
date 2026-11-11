create table if not exists echo_sites(id text primary key, url text, host text, title text, content text, lang text, ip_hash text, hits int default 0, created_at timestamptz default now());
create table if not exists echo_leads(id bigserial primary key, site_id text default 'echo', name text, email text, need text, lang text, convo text, created_at timestamptz default now());
create table if not exists echo_config(k text primary key, v text);
alter table echo_sites enable row level security;
alter table echo_leads enable row level security;
alter table echo_config enable row level security;
create index if not exists echo_sites_created on echo_sites(created_at);
