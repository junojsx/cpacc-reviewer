import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { EXAM_META, type ExamType } from "@/lib/exams";

type Choice = { key: string; text: string };

export default async function ResultsPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: attempt } = await supabase
    .from("attempts")
    .select("id, exam_type, question_ids, started_at, completed_at")
    .eq("id", id)
    .single();
  if (!attempt) notFound();

  const { data: questions } = await supabase
    .from("questions")
    .select("id, domain, question, choices, correct_answer, explanation")
    .in("id", attempt.question_ids);

  const { data: answers } = await supabase
    .from("attempt_answers")
    .select("question_id, selected_answer")
    .eq("attempt_id", attempt.id);

  const answerMap = new Map(
    (answers ?? []).map((a) => [a.question_id, a.selected_answer]),
  );
  const qById = new Map((questions ?? []).map((q) => [q.id, q]));

  const ordered = attempt.question_ids
    .map((qid: string) => qById.get(qid))
    .filter(Boolean) as Array<{
    id: string;
    domain: string;
    question: string;
    choices: Choice[];
    correct_answer: string;
    explanation: string | null;
  }>;

  let correctCount = 0;
  const byDomain: Record<string, { correct: number; total: number }> = {};
  for (const q of ordered) {
    const sel = answerMap.get(q.id);
    const isCorrect = sel === q.correct_answer;
    if (isCorrect) correctCount += 1;
    byDomain[q.domain] ??= { correct: 0, total: 0 };
    byDomain[q.domain].total += 1;
    if (isCorrect) byDomain[q.domain].correct += 1;
  }

  const total = ordered.length;
  const pct = total > 0 ? correctCount / total : 0;
  const meta = EXAM_META[attempt.exam_type as ExamType];
  const passed = pct >= meta.passingScore;

  return (
    <main id="main" className="mx-auto max-w-3xl px-6 py-10">
      <header className="mb-6">
        <p className="text-xs uppercase tracking-wide text-slate-500">
          {attempt.exam_type} results
        </p>
        <h1 className="text-3xl font-bold">
          {correctCount} / {total} correct ({Math.round(pct * 100)}%)
        </h1>
        <p
          className={`mt-2 inline-block rounded-md px-3 py-1 text-sm font-semibold ${
            passed ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"
          }`}
        >
          {passed ? "Passing" : "Below passing threshold"} (pass ≥{" "}
          {Math.round(meta.passingScore * 100)}%)
        </p>
      </header>

      <section aria-labelledby="domains-heading" className="mb-10">
        <h2 id="domains-heading" className="text-lg font-semibold">
          By domain
        </h2>
        <ul className="mt-3 space-y-2">
          {Object.entries(byDomain).map(([domain, s]) => {
            const dPct = Math.round((s.correct / s.total) * 100);
            return (
              <li
                key={domain}
                className="rounded-md border border-slate-200 bg-white p-3"
              >
                <div className="flex items-baseline justify-between gap-4">
                  <span className="text-sm font-medium">{domain}</span>
                  <span className="text-sm tabular-nums text-slate-600">
                    {s.correct}/{s.total} ({dPct}%)
                  </span>
                </div>
                <div
                  className="mt-2 h-2 w-full overflow-hidden rounded bg-slate-100"
                  role="presentation"
                >
                  <div
                    className="h-full bg-blue-600"
                    style={{ width: `${dPct}%` }}
                  />
                </div>
              </li>
            );
          })}
        </ul>
      </section>

      <section aria-labelledby="review-heading">
        <h2 id="review-heading" className="text-lg font-semibold">
          Review answers
        </h2>
        <ol className="mt-4 space-y-6">
          {ordered.map((q, i) => {
            const sel = answerMap.get(q.id) ?? null;
            const isCorrect = sel === q.correct_answer;
            return (
              <li
                key={q.id}
                className="rounded-md border border-slate-200 bg-white p-4"
              >
                <p className="text-xs uppercase tracking-wide text-slate-500">
                  {q.domain}
                </p>
                <p className="mt-1 font-medium">
                  {i + 1}. {q.question}
                </p>
                <ul className="mt-3 space-y-2 text-sm">
                  {q.choices.map((c) => {
                    const isCorrectChoice = c.key === q.correct_answer;
                    const isSelected = c.key === sel;
                    const base = "rounded-md border px-3 py-2 flex gap-2";
                    const style = isCorrectChoice
                      ? "border-green-500 bg-green-50"
                      : isSelected
                        ? "border-red-400 bg-red-50"
                        : "border-slate-200 bg-white";
                    return (
                      <li key={c.key} className={`${base} ${style}`}>
                        <span className="font-semibold">{c.key}.</span>
                        <span>{c.text}</span>
                        {isCorrectChoice && (
                          <span className="ml-auto text-xs font-semibold text-green-700">
                            Correct
                          </span>
                        )}
                        {!isCorrectChoice && isSelected && (
                          <span className="ml-auto text-xs font-semibold text-red-700">
                            Your answer
                          </span>
                        )}
                      </li>
                    );
                  })}
                </ul>
                {!sel && (
                  <p className="mt-3 text-xs italic text-slate-500">
                    Unanswered.
                  </p>
                )}
                {q.explanation && (
                  <p className="mt-3 rounded-md bg-slate-50 p-3 text-sm text-slate-700">
                    <span className="font-semibold">
                      {isCorrect ? "Why this is correct" : "Explanation"}:
                    </span>{" "}
                    {q.explanation}
                  </p>
                )}
              </li>
            );
          })}
        </ol>
      </section>

      <div className="mt-10">
        <Link
          href="/dashboard"
          className="rounded-md bg-blue-600 px-4 py-2 font-medium text-white hover:bg-blue-700"
        >
          Back to dashboard
        </Link>
      </div>
    </main>
  );
}
