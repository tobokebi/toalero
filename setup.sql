-- Run this in Supabase Dashboard > SQL Editor.

-- 1. Create the responses table
create table if not exists public.proposal_responses (
  id bigint generated always as identity primary key,
  recipient text not null default 'Alero',
  proposal_answer text,
  flaws text,
  understanding text,
  appreciation text,
  communication text,
  shared_goals text,
  adventures text,
  relationship_vision text,
  mutual_support text,
  anything_else text,
  submitted_at timestamptz not null default now()
);

-- 2. Enable Row Level Security (RLS)
alter table public.proposal_responses enable row level security;
revoke all on public.proposal_responses from anon, authenticated;

-- 3. Allow anonymous submissions (Insert only)
grant insert on public.proposal_responses to anon;
create policy "Anyone can submit a response" on public.proposal_responses
  for insert to anon with check (recipient in ('Alero', 'Baby bluey', 'Blueyy'));

-- 4. Secure RPC function: allows your hidden admin panel to read responses remotely using your secret PIN
create or replace function public.get_proposal_responses(admin_pin text)
returns setof public.proposal_responses
language plpgsql
security definer
as $$
begin
  -- Change '2026' to your chosen secret PIN if desired
  if admin_pin = '2026' then
    return query select * from public.proposal_responses order by submitted_at desc;
  else
    raise exception 'Unauthorized';
  end if;
end;
$$;

grant execute on function public.get_proposal_responses(text) to anon;
