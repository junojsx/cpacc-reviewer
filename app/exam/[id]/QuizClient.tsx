"use client";

import { useCallback, useEffect, useMemo, useState, useTransition } from "react";
import { saveAnswer, submitAttempt } from "@/app/exam/actions";
import { formatTime } from "@/lib/exams";

type Choice = { key: string; text: string };
type Question = {
  id: string;
  domain: string;
  question: string;
  choices: Choice[];
};

export default function QuizClient({
  attemptId,
  examType,
  questions,
  initialAnswers,
  deadlineMs,
}: {
  attemptId: string;
  examType: string;
  questions: Question[];
  initialAnswers: Record<string, string | null>;
  deadlineMs: number;
}) {
  const [index, setIndex] = useState(0);
  const [answers, setAnswers] = useState(initialAnswers);
  const [remaining, setRemaining] = useState(() =>
    Math.max(0, Math.floor((deadlineMs - Date.now()) / 1000)),
  );
  const [savingFor, setSavingFor] = useState<string | null>(null);
  const [submitting, startSubmit] = useTransition();

  const total = questions.length;
  const current = questions[index];

  const answeredCount = useMemo(
    () => Object.values(answers).filter(Boolean).length,
    [answers],
  );

  const handleSubmit = useCallback(() => {
    startSubmit(async () => {
      await submitAttempt(attemptId);
    });
  }, [attemptId]);

  // Timer
  useEffect(() => {
    const t = setInterval(() => {
      const r = Math.max(0, Math.floor((deadlineMs - Date.now()) / 1000));
      setRemaining(r);
      if (r === 0) {
        clearInterval(t);
        handleSubmit();
      }
    }, 1000);
    return () => clearInterval(t);
  }, [deadlineMs, handleSubmit]);

  async function pick(key: string) {
    const qid = current.id;
    setAnswers((prev) => ({ ...prev, [qid]: key }));
    setSavingFor(qid);
    try {
      await saveAnswer(attemptId, qid, key);
    } finally {
      setSavingFor((s) => (s === qid ? null : s));
    }
  }

  const goto = (i: number) => setIndex(Math.max(0, Math.min(total - 1, i)));

  const lowTime = remaining <= 60;

  return (
    <main id="main" className="mx-auto max-w-3xl px-4 py-6 sm:py-10">
      <header className="mb-6 flex flex-wrap items-center justify-between gap-3">
        <div>
          <p className="text-xs uppercase tracking-wide text-slate-500">
            {examType} practice
          </p>
          <h1 className="text-2xl font-bold">
            Question {index + 1} of {total}
          </h1>
        </div>
        <div
          role="timer"
          aria-live="off"
          aria-label={`Time remaining ${formatTime(remaining)}`}
          className={`rounded-md px-3 py-1.5 text-sm font-semibold tabular-nums ${
            lowTime
              ? "bg-red-100 text-red-800"
              : "bg-slate-100 text-slate-800"
          }`}
        >
          {formatTime(remaining)}
        </div>
      </header>

      <p className="mb-2 text-xs font-medium uppercase tracking-wide text-slate-500">
        {current.domain}
      </p>
      <h2 className="text-lg font-medium leading-relaxed">{current.question}</h2>

      <fieldset className="mt-6 space-y-3">
        <legend className="sr-only">Answer choices</legend>
        {current.choices.map((c) => {
          const selected = answers[current.id] === c.key;
          return (
            <label
              key={c.key}
              className={`flex cursor-pointer items-start gap-3 rounded-md border p-3 text-sm ${
                selected
                  ? "border-blue-500 bg-blue-50"
                  : "border-slate-200 bg-white hover:bg-slate-50"
              }`}
            >
              <input
                type="radio"
                name={`q-${current.id}`}
                value={c.key}
                checked={selected}
                onChange={() => pick(c.key)}
                className="mt-1"
              />
              <span>
                <span className="font-semibold">{c.key}.</span> {c.text}
              </span>
            </label>
          );
        })}
      </fieldset>

      <div className="mt-4 h-5 text-xs text-slate-500" aria-live="polite">
        {savingFor === current.id ? "Saving…" : ""}
      </div>

      <nav
        aria-label="Question navigation"
        className="mt-6 flex flex-wrap items-center justify-between gap-3"
      >
        <div className="flex gap-2">
          <button
            type="button"
            onClick={() => goto(index - 1)}
            disabled={index === 0}
            className="rounded-md border border-slate-300 bg-white px-3 py-1.5 text-sm disabled:opacity-50"
          >
            Previous
          </button>
          <button
            type="button"
            onClick={() => goto(index + 1)}
            disabled={index === total - 1}
            className="rounded-md border border-slate-300 bg-white px-3 py-1.5 text-sm disabled:opacity-50"
          >
            Next
          </button>
        </div>
        <p className="text-sm text-slate-600">
          Answered {answeredCount} / {total}
        </p>
      </nav>

      <section aria-labelledby="grid-heading" className="mt-8">
        <h3 id="grid-heading" className="text-sm font-semibold">
          Jump to question
        </h3>
        <ol className="mt-2 flex flex-wrap gap-2">
          {questions.map((q, i) => {
            const status = answers[q.id]
              ? "bg-blue-600 text-white border-blue-600"
              : "bg-white border-slate-300 text-slate-700";
            const isCurrent = i === index;
            return (
              <li key={q.id}>
                <button
                  type="button"
                  onClick={() => goto(i)}
                  aria-current={isCurrent ? "step" : undefined}
                  className={`h-8 w-8 rounded-md border text-xs font-semibold tabular-nums ${status} ${
                    isCurrent ? "ring-2 ring-offset-1 ring-blue-500" : ""
                  }`}
                >
                  {i + 1}
                </button>
              </li>
            );
          })}
        </ol>
      </section>

      <div className="mt-10 flex justify-end">
        <button
          type="button"
          onClick={() => {
            if (
              answeredCount < total &&
              !confirm(
                `You've answered ${answeredCount} of ${total}. Submit anyway?`,
              )
            ) {
              return;
            }
            handleSubmit();
          }}
          disabled={submitting}
          className="rounded-md bg-green-600 px-5 py-2 font-semibold text-white hover:bg-green-700 disabled:opacity-50"
        >
          {submitting ? "Submitting…" : "Submit exam"}
        </button>
      </div>
    </main>
  );
}
