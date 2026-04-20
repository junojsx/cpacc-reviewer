# CPACC / WAS Reviewer

A timed practice-test app for the IAAP **Certified Professional in Accessibility Core Competencies (CPACC)** and **Web Accessibility Specialist (WAS)** certifications.

Built with **Next.js 15** (App Router, TypeScript, Tailwind) and **Supabase** (auth + Postgres).

> The included questions are original practice items covering the published IAAP domains. They are not real exam items.

## Features

- Email / password auth (Supabase)
- Separate CPACC and WAS mock tests with their own question banks, time limits, and passing thresholds
- Random question selection per attempt
- Answer auto-save as you go (resume if you close the tab)
- Countdown timer with auto-submit
- Results page with per-domain breakdown and explanations for every question
- Row-level security — each user can only see their own attempts

## Setup

### 1. Install dependencies

```bash
npm install
```

### 2. Create a Supabase project

1. Go to <https://supabase.com> and create a new project.
2. Wait for it to provision.
3. In **Project Settings → API**, copy:
   - `Project URL` → `NEXT_PUBLIC_SUPABASE_URL`
   - `anon public` key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

### 3. Environment variables

```bash
cp .env.local.example .env.local
# then edit .env.local with your values
```

### 4. Run the migration and seed

In the Supabase dashboard, open **SQL Editor** and run (in this order):

1. The contents of `supabase/migrations/0001_init.sql` — creates tables and RLS policies.
2. The contents of `supabase/seed.sql` — inserts practice questions.

(Re-running the seed wipes existing questions; old attempts will lose their question links.)

### 5. (Optional) Disable email confirmation for local dev

By default Supabase requires email confirmation on signup. For local testing, go to **Authentication → Providers → Email** and toggle *Confirm email* off. With it off, signup logs you in immediately.

### 6. Run the app

```bash
npm run dev
```

Open <http://localhost:3000>.

## Project layout

```
app/
  page.tsx                    # landing
  login/, signup/             # auth pages
  auth/actions.ts             # login / signup / signout server actions
  dashboard/                  # start exams, list attempts
  exam/[id]/                  # quiz UI (timer, nav, auto-save)
  exam/actions.ts             # startAttempt / saveAnswer / submitAttempt
  results/[id]/               # score + per-domain + explanations
lib/
  exams.ts                    # exam metadata (question counts, time limits)
  supabase/                   # browser / server / middleware clients
supabase/
  migrations/0001_init.sql    # schema + RLS
  seed.sql                    # practice questions
proxy.ts                      # auth-refresh + route protection (Next 16 proxy)
```

## Data model

- `questions(id, exam_type, domain, question, choices, correct_answer, explanation)`
- `attempts(id, user_id, exam_type, question_ids[], time_limit_seconds, started_at, completed_at)`
- `attempt_answers(attempt_id, question_id, selected_answer)`

All tables have RLS enabled: users can only read/write their own `attempts` and `attempt_answers`. Any authenticated user can read `questions`.

## Adding questions

Append more `insert` rows to `supabase/seed.sql` (or insert directly in the SQL editor — RLS only restricts clients, not the dashboard). Choices use the shape:

```json
[{"key":"A","text":"..."},{"key":"B","text":"..."}]
```

and `correct_answer` must match one of the keys.
# cpacc-reviewer
