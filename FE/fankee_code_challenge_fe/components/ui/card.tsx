import { Eye, Layers } from "lucide-react";
import { cn } from "@/lib/utils";

type CardProps = {
  genre: string;
  title: string;
  artist: string;
  imageSrc: string;
  className?: string;
};

function Card({ genre, title, artist, imageSrc, className }: CardProps) {
  return (
    <article
      className={cn(
        "relative h-[620px] w-[420px] overflow-hidden rounded-[34px] border border-white/10",
        className,
      )}
    >
      <img
        src={imageSrc}
        alt={`${artist} track cover`}
        className="absolute inset-0 h-full w-full object-cover"
      />

      <div className="absolute inset-0 bg-gradient-to-b from-black/50 via-black/45 to-black/70" />

      <div className="absolute inset-0 flex flex-col px-10 py-9">

        <p className="text-[18px] font-semibold uppercase tracking-[0.02em] text-[#d4e4ea]"> {genre} </p>
        <div className="mt-4 h-[3px] w-full bg-[#ffe600]" />

        <div className="mt-auto flex flex-col items-center text-center">
          <h2 className="text-center text-[25px] font-bold leading-none text-[#f3f5f6]">{title}</h2>
          <p className="mt-4 text-center text-[15px] font-semibold leading-none text-[#ffe600]">{artist}</p>
        </div>

        <div className="mt-10 h-[3px] w-full bg-[#ffe600]" />

        <div className="mt-5 flex items-center justify-center gap-5 text-[#ffe600]">
          <Eye size={20} strokeWidth={2.2} />
        </div>
      </div>
    </article>
  );
}

export { Card };
