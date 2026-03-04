"use client";

import { Trophy } from "lucide-react";
import { usePathname, useRouter } from "next/navigation";

export default function LeaderboardCornerButton() {
  const pathname = usePathname();
  const router = useRouter();

  const showOnTracklistSection = pathname === "/tracklist" || pathname.startsWith("/tracklist/");

  if (!showOnTracklistSection) {
    return null;
  }

  return (
    <button
      type="button"
      aria-label="Open leaderboard"
      onClick={() => router.push("/leaderboard")}
      className="fixed bottom-12 left-6 z-50 flex h-12 w-12 items-center justify-center rounded-full bg-[#ffe600] text-black shadow-[0_8px_22px_rgba(0,0,0,0.35)] transition-transform hover:scale-105"
    >
      <Trophy size={20} strokeWidth={2.4} />
    </button>
  );
}
