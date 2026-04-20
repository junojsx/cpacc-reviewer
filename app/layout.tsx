import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "CPACC / WAS Reviewer",
  description: "Practice tests for IAAP CPACC and WAS certifications.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="min-h-screen bg-slate-50 text-slate-900 antialiased">
        <a
          href="#main"
          className="sr-only focus:not-sr-only focus:absolute focus:top-2 focus:left-2 focus:z-50 focus:rounded focus:bg-white focus:px-3 focus:py-2 focus:shadow"
        >
          Skip to main content
        </a>
        {children}
      </body>
    </html>
  );
}
