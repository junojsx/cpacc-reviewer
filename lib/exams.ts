export type ExamType = "CPACC" | "WAS";

export const EXAM_META: Record<
  ExamType,
  {
    title: string;
    fullName: string;
    description: string;
    numQuestions: number;
    timeLimitSeconds: number;
    passingScore: number;
    domains: string[];
  }
> = {
  CPACC: {
    title: "CPACC",
    fullName: "Certified Professional in Accessibility Core Competencies",
    description:
      "Foundational accessibility knowledge — disabilities, universal design, standards and laws.",
    numQuestions: 20,
    timeLimitSeconds: 30 * 60,
    passingScore: 0.7,
    domains: [
      "Disabilities, Challenges, and Assistive Technologies",
      "Accessibility and Universal Design",
      "Standards, Laws, and Management Strategies",
    ],
  },
  WAS: {
    title: "WAS",
    fullName: "Web Accessibility Specialist",
    description:
      "Technical web accessibility — creating, identifying, and remediating issues against WCAG.",
    numQuestions: 20,
    timeLimitSeconds: 30 * 60,
    passingScore: 0.7,
    domains: [
      "Create Accessible Web Solutions",
      "Identify Web Accessibility Issues",
      "Remediate Web Accessibility Issues",
    ],
  },
};

export function formatTime(seconds: number): string {
  const m = Math.floor(seconds / 60);
  const s = seconds % 60;
  return `${m}:${s.toString().padStart(2, "0")}`;
}
