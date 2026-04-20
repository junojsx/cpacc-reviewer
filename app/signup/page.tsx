import Link from "next/link";
import { signup } from "@/app/auth/actions";

export default async function SignupPage({
  searchParams,
}: {
  searchParams: Promise<{ error?: string; check?: string }>;
}) {
  const { error, check } = await searchParams;

  return (
    <main id="main" className="mx-auto max-w-sm px-6 py-16">
      <h1 className="text-2xl font-semibold">Create an account</h1>

      {check ? (
        <p className="mt-6 rounded-md border border-blue-200 bg-blue-50 p-3 text-sm text-blue-900">
          Check your email to confirm your account, then log in.
        </p>
      ) : (
        <form action={signup} className="mt-6 space-y-4">
          <div>
            <label htmlFor="email" className="block text-sm font-medium">
              Email
            </label>
            <input
              id="email"
              name="email"
              type="email"
              required
              autoComplete="email"
              className="mt-1 w-full rounded-md border border-slate-300 px-3 py-2"
            />
          </div>
          <div>
            <label htmlFor="password" className="block text-sm font-medium">
              Password
            </label>
            <input
              id="password"
              name="password"
              type="password"
              minLength={6}
              required
              autoComplete="new-password"
              className="mt-1 w-full rounded-md border border-slate-300 px-3 py-2"
            />
            <p className="mt-1 text-xs text-slate-500">Minimum 6 characters.</p>
          </div>

          {error && (
            <p role="alert" className="text-sm text-red-600">
              {error}
            </p>
          )}

          <button
            type="submit"
            className="w-full rounded-md bg-blue-600 px-4 py-2 font-medium text-white hover:bg-blue-700"
          >
            Sign up
          </button>
        </form>
      )}

      <p className="mt-4 text-sm text-slate-600">
        Already have an account?{" "}
        <Link href="/login" className="text-blue-600 underline">
          Log in
        </Link>
      </p>
    </main>
  );
}
