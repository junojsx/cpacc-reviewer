import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import QuizClient from "./QuizClient";

type Choice = { key: string; text: string };

export default async function ExamPage({
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
    .select("id, exam_type, question_ids, time_limit_seconds, started_at, completed_at")
    .eq("id", id)
    .single();

  if (!attempt) notFound();
  if (attempt.completed_at) redirect(`/results/${attempt.id}`);

  const { data: questionRows } = await supabase
    .from("questions")
    .select("id, domain, question, choices")
    .in("id", attempt.question_ids);

  // Preserve the attempt's question order
  const byId = new Map((questionRows ?? []).map((q) => [q.id, q]));
  const questions = attempt.question_ids
    .map((qid: string) => byId.get(qid))
    .filter(Boolean) as Array<{
    id: string;
    domain: string;
    question: string;
    choices: Choice[];
  }>;

  if (questions.length === 0) {
    return (
      <main className="mx-auto max-w-3xl px-4 py-10">
        <h1 className="text-2xl font-bold">This attempt is no longer valid</h1>
        <p className="mt-3 text-slate-700">
          The questions linked to this attempt no longer exist (the question
          bank was re-seeded). Start a fresh attempt from the dashboard.
        </p>
        <a
          href="/dashboard"
          className="mt-6 inline-block rounded-md bg-blue-600 px-4 py-2 text-sm font-medium text-white"
        >
          Back to dashboard
        </a>
      </main>
    );
  }

  const { data: savedAnswers } = await supabase
    .from("attempt_answers")
    .select("question_id, selected_answer")
    .eq("attempt_id", attempt.id);

  const initialAnswers: Record<string, string | null> = {};
  for (const a of savedAnswers ?? []) {
    initialAnswers[a.question_id] = a.selected_answer;
  }

  const startedAtMs = new Date(attempt.started_at).getTime();
  const deadlineMs = startedAtMs + attempt.time_limit_seconds * 1000;

  return (
    <QuizClient
      attemptId={attempt.id}
      examType={attempt.exam_type}
      questions={questions}
      initialAnswers={initialAnswers}
      deadlineMs={deadlineMs}
    />
  );
}
