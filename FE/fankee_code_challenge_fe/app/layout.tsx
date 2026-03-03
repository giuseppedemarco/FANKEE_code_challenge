import type { Metadata } from "next";
import { Roboto_Mono } from "next/font/google";
import FankeeCornerLogo from "../components/ui/FankeeCornerLogo";
import "./globals.css";

const robotoMono = Roboto_Mono({
  variable: "--font-roboto-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "FANKEE - Playground",
  description: "FANKEE CODE CHALLENGE by Giuseppe De Marco",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${robotoMono.variable} antialiased`}>
        {children}
        <FankeeCornerLogo />
      </body>
    </html>
  );
}
