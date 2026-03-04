import type { Metadata } from "next";
import { Roboto_Mono } from "next/font/google";
import FankeeCornerLogo from "../components/ui/FankeeCornerLogo";
import LeaderboardCornerButton from "../components/ui/LeaderboardCornerButton";
import ServiceWorkerRegistration from "../components/ui/ServiceWorkerRegistration";
import "./globals.css";

const robotoMono = Roboto_Mono({
  variable: "--font-roboto-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "FANKEE - Playground",
  description: "FANKEE CODE CHALLENGE by Giuseppe De Marco",
  manifest: "/manifest.webmanifest",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${robotoMono.variable} antialiased`}>
        <ServiceWorkerRegistration />
        {children}
        <LeaderboardCornerButton />
        <FankeeCornerLogo />
      </body>
    </html>
  );
}
