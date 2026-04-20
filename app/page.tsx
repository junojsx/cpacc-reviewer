import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { EXAM_META } from "@/lib/exams";

export default async function HomePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  return (
    <main id="main" className="mx-auto max-w-3xl px-6 py-16">
      <header className="mb-10">
        <h1 className="text-4xl font-bold tracking-tight">
          CPACC &amp; WAS Reviewer
        </h1>
        <p className="mt-3 text-lg text-slate-600">
          Timed practice tests for the IAAP Certified Professional in
          Accessibility Core Competencies and Web Accessibility Specialist
          certifications.
        </p>
      </header>

      <section aria-labelledby="exams-heading" className="grid gap-4 sm:grid-cols-2">
        <h2 id="exams-heading" className="sr-only">
          Available exams
        </h2>
        {(["CPACC", "WAS"] as const).map((exam) => {
          const meta = EXAM_META[exam];
          return (
            <article
              key={exam}
              className="rounded-lg border border-slate-200 bg-white p-5 shadow-sm"
            >
              <h3 className="text-xl font-semibold">{meta.title}</h3>
              <p className="mt-1 text-sm text-slate-500">{meta.fullName}</p>
              <p className="mt-3 text-sm text-slate-700">{meta.description}</p>
              <dl className="mt-4 grid grid-cols-2 gap-2 text-sm">
                <div>
                  <dt className="text-slate-500">Questions</dt>
                  <dd className="font-medium">{meta.numQuestions}</dd>
                </div>
                <div>
                  <dt className="text-slate-500">Time limit</dt>
                  <dd className="font-medium">
                    {Math.round(meta.timeLimitSeconds / 60)} min
                  </dd>
                </div>
              </dl>
            </article>
          );
        })}
      </section>

      <div className="mt-10 flex gap-3">
        {user ? (
          <Link
            href="/dashboard"
            className="rounded-md bg-blue-600 px-4 py-2 font-medium text-white hover:bg-blue-700"
          >
            Go to dashboard
          </Link>
        ) : (
          <>
            <Link
              href="/signup"
              className="rounded-md bg-blue-600 px-4 py-2 font-medium text-white hover:bg-blue-700"
            >
              Create an account
            </Link>
            <Link
              href="/login"
              className="rounded-md border border-slate-300 bg-white px-4 py-2 font-medium hover:bg-slate-50"
            >
              Log in
            </Link>
          </>
        )}
      </div>

      <p className="mt-10 text-xs text-slate-500">
        Practice questions are illustrative and not real exam items.
      </p>
    </main>
  );
}
