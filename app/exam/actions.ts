"use server";

import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
import { EXAM_META, type ExamType } from "@/lib/exams";

function shuffle<T>(arr: T[]): T[] {
  const out = [...arr];
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [out[i], out[j]] = [out[j], out[i]];
  }
  return out;
}

export async function startAttempt(formData: FormData) {
  const examType = String(formData.get("examType")) as ExamType;
  if (!EXAM_META[examType]) throw new Error("Invalid exam type");

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const meta = EXAM_META[examType];

  const { data: questions, error: qErr } = await supabase
    .from("questions")
    .select("id")
    .eq("exam_type", examType);
  if (qErr) throw qErr;
  if (!questions || questions.length === 0) {
    throw new Error(`No questions seeded for ${examType}.`);
  }

  const picked = shuffle(questions.map((q) => q.id)).slice(0, meta.numQuestions);

  const { data: attempt, error: aErr } = await supabase
    .from("attempts")
    .insert({
      user_id: user.id,
      exam_type: examType,
      question_ids: picked,
      time_limit_seconds: meta.timeLimitSeconds,
    })
    .select("id")
    .single();
  if (aErr) throw aErr;

  revalidatePath("/dashboard");
  redirect(`/exam/${attempt.id}`);
}

export async function saveAnswer(
  attemptId: string,
  questionId: string,
  selected: string | null,
) {
  const supabase = await createClient();
  const { error } = await supabase
    .from("attempt_answers")
    .upsert(
      {
        attempt_id: attemptId,
        question_id: questionId,
        selected_answer: selected,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "attempt_id,question_id" },
    );
  if (error) throw error;
}

export async function submitAttempt(attemptId: string) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { error } = await supabase
    .from("attempts")
    .update({ completed_at: new Date().toISOString() })
    .eq("id", attemptId)
    .eq("user_id", user.id);
  if (error) throw error;

  revalidatePath("/dashboard");
  redirect(`/results/${attemptId}`);
}
