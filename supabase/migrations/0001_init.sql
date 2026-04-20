-- CPACC/WAS reviewer schema

create extension if not exists "pgcrypto";

create table if not exists public.questions (
  id uuid primary key default gen_random_uuid(),
  exam_type text not null check (exam_type in ('CPACC', 'WAS')),
  domain text not null,
  question text not null,
  choices jsonb not null, -- [{"key":"A","text":"..."}, ...]
  correct_answer text not null,
  explanation text,
  created_at timestamptz not null default now()
);

create index if not exists questions_exam_type_idx on public.questions (exam_type);

create table if not exists public.attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  exam_type text not null check (exam_type in ('CPACC', 'WAS')),
  question_ids uuid[] not null,
  time_limit_seconds integer not null,
  started_at timestamptz not null default now(),
  completed_at timestamptz
);

create index if not exists attempts_user_idx on public.attempts (user_id, started_at desc);

create table if not exists public.attempt_answers (
  attempt_id uuid not null references public.attempts(id) on delete cascade,
  question_id uuid not null references public.questions(id) on delete cascade,
  selected_answer text,
  updated_at timestamptz not null default now(),
  primary key (attempt_id, question_id)
);

-- RLS
alter table public.questions enable row level security;
alter table public.attempts enable row level security;
alter table public.attempt_answers enable row level security;

-- Questions: any authenticated user can read; nobody writes via API (seeded server-side).
drop policy if exists "questions_read" on public.questions;
create policy "questions_read" on public.questions
  for select to authenticated using (true);

-- Attempts: owner-only.
drop policy if exists "attempts_select_own" on public.attempts;
create policy "attempts_select_own" on public.attempts
  for select to authenticated using (auth.uid() = user_id);

drop policy if exists "attempts_insert_own" on public.attempts;
create policy "attempts_insert_own" on public.attempts
  for insert to authenticated with check (auth.uid() = user_id);

drop policy if exists "attempts_update_own" on public.attempts;
create policy "attempts_update_own" on public.attempts
  for update to authenticated using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Attempt answers: only for attempts the user owns.
drop policy if exists "attempt_answers_select_own" on public.attempt_answers;
create policy "attempt_answers_select_own" on public.attempt_answers
  for select to authenticated using (
    exists (select 1 from public.attempts a where a.id = attempt_id and a.user_id = auth.uid())
  );

drop policy if exists "attempt_answers_upsert_own" on public.attempt_answers;
create policy "attempt_answers_upsert_own" on public.attempt_answers
  for insert to authenticated with check (
    exists (select 1 from public.attempts a where a.id = attempt_id and a.user_id = auth.uid() and a.completed_at is null)
  );

drop policy if exists "attempt_answers_update_own" on public.attempt_answers;
create policy "attempt_answers_update_own" on public.attempt_answers
  for update to authenticated using (
    exists (select 1 from public.attempts a where a.id = attempt_id and a.user_id = auth.uid() and a.completed_at is null)
  );
