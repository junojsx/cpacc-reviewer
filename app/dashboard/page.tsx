import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { EXAM_META, type ExamType } from "@/lib/exams";
import { startAttempt } from "@/app/exam/actions";
import { signOut } from "@/app/auth/actions";

export default async function DashboardPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const { data: attempts } = await supabase
    .from("attempts")
    .select("id, exam_type, started_at, completed_at")
    .order("started_at", { ascending: false })
    .limit(20);

  return (
    <main id="main" className="mx-auto max-w-3xl px-6 py-10">
      <header className="mb-8 flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Dashboard</h1>
          <p className="text-sm text-slate-600">{user?.email}</p>
        </div>
        <form action={signOut}>
          <button
            type="submit"
            className="rounded-md border border-slate-300 bg-white px-3 py-1.5 text-sm hover:bg-slate-50"
          >
            Sign out
          </button>
        </form>
      </header>

      <section aria-labelledby="start-heading">
        <h2 id="start-heading" className="text-xl font-semibold">
          Start a practice test
        </h2>
        <div className="mt-4 grid gap-4 sm:grid-cols-2">
          {(["CPACC", "WAS"] as const).map((exam) => (
            <ExamStartCard key={exam} exam={exam} />
          ))}
        </div>
      </section>

      <section aria-labelledby="attempts-heading" className="mt-12">
        <h2 id="attempts-heading" className="text-xl font-semibold">
          Your recent attempts
        </h2>
        {attempts && attempts.length > 0 ? (
          <ul className="mt-4 divide-y divide-slate-200 rounded-md border border-slate-200 bg-white">
            {attempts.map((a) => (
              <li key={a.id} className="flex items-center justify-between p-4">
                <div>
                  <p className="font-medium">{a.exam_type}</p>
                  <p className="text-sm text-slate-500">
                    Started {new Date(a.started_at).toLocaleString()}
                    {a.completed_at
                      ? ` · Completed ${new Date(a.completed_at).toLocaleString()}`
                      : " · In progress"}
                  </p>
                </div>
                <Link
                  href={a.completed_at ? `/results/${a.id}` : `/exam/${a.id}`}
                  className="text-sm font-medium text-blue-600 underline"
                >
                  {a.completed_at ? "View results" : "Resume"}
                </Link>
              </li>
            ))}
          </ul>
        ) : (
          <p className="mt-4 text-sm text-slate-600">No attempts yet.</p>
        )}
      </section>
    </main>
  );
}

function ExamStartCard({ exam }: { exam: ExamType }) {
  const meta = EXAM_META[exam];
  return (
    <form
      action={startAttempt}
      className="rounded-lg border border-slate-200 bg-white p-5"
    >
      <input type="hidden" name="examType" value={exam} />
      <h3 className="text-lg font-semibold">{meta.title}</h3>
      <p className="mt-1 text-sm text-slate-500">{meta.fullName}</p>
      <p className="mt-2 text-sm text-slate-700">{meta.description}</p>
      <p className="mt-3 text-xs text-slate-500">
        {meta.numQuestions} questions · {Math.round(meta.timeLimitSeconds / 60)}{" "}
        min · pass at {Math.round(meta.passingScore * 100)}%
      </p>
      <button
        type="submit"
        className="mt-4 w-full rounded-md bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
      >
        Start {meta.title}
      </button>
    </form>
  );
}
