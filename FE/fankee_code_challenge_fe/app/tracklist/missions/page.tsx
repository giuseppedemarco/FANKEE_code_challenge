"use client";

import { useSearchParams } from "next/navigation";

export default function Missions() {
  const searchParams = useSearchParams();

  const artist = searchParams.get("artist") ?? "Unknown artist";
  const title = searchParams.get("title") ?? "Untitled track";
  const genre = searchParams.get("genre") ?? "Unknown genre";
  const imageSrc = searchParams.get("imageSrc") ?? "Unknown image src";

  return (
    <div className="relative flex min-h-screen flex-col items-center bg-gradient-to-b from-[#6f6500] via-[#141300] to-black px-5 pt-8">
      <div className="z-[20] mt-16 text-center">
        <p className="text-lg text-[#ffe600]">{genre}</p>
        <p className="mt-2 text-4xl font-semibold text-white">{title}</p>
        <p className="mt-2 text-2xl text-[#ffe600]">{artist}</p>
      </div>

      <div
        className="absolute left-0 top-0 z-0 h-screen w-full bg-left bg-cover bg-no-repeat opacity-35"
        style={{ backgroundImage: `url(${imageSrc})` }}
      />
    </div>
  );
}
