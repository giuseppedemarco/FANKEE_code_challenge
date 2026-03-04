"use client";

import { useSearchParams } from "next/navigation";

export default function Missions() {
  const searchParams = useSearchParams();

  const artist = searchParams.get("artist") ?? "Unknown artist";
  const title = searchParams.get("title") ?? "Untitled track";
  const genre = searchParams.get("genre") ?? "Unknown genre";

  return (
    <div className="flex min-h-screen flex-col items-center bg-gradient-to-b from-[#6f6500] via-[#141300] to-black px-5 pt-8">
      <div className="mt-16 text-center">
        <p className="text-lg text-[#ffe600]">{genre}</p>
        <p className="mt-2 text-4xl font-semibold text-white">{title}</p>
        <p className="mt-2 text-2xl text-[#ffe600]">{artist}</p>
      </div>
    </div>
  );
}
