"use client";

import { useEffect, useState } from "react";
import { useSearchParams } from "next/navigation";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import { GenerateMissionsResponse, Mission } from "@/lib/models/missions";

export default function Missions() {
  const searchParams = useSearchParams();

  const artist = searchParams.get("artist") ?? "Unknown artist";
  const title = searchParams.get("title") ?? "Untitled track";
  const genre = searchParams.get("genre") ?? "Unknown genre";
  const description = searchParams.get("description") ?? genre;
  const imageSrc = searchParams.get("imageSrc") ?? "";

  const [missions, setMissions] = useState<Mission[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    let isMounted = true;

    const loadMissions = async () => {
      setLoading(true);
      setError("");

      try {
        const response = await fetch("/api/missions", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            artist_name: artist,
            track_title: title,
            track_description: description,
          }),
        });

        const data = (await response.json()) as GenerateMissionsResponse & {
          error?: string;
          detail?: string;
        };

        if (!response.ok) {
          throw new Error(data.detail ?? data.error ?? "Error while loading missions.");
        }

        if (isMounted) {
          setMissions(data.missions ?? []);
        }
      } catch (requestError) {
        if (isMounted) {
          const message = requestError instanceof Error ? requestError.message : "Error while loading missions.";
          setError(message);
          setMissions([]);
        }
      } finally {
        if (isMounted) {
          setLoading(false);
        }
      }
    };

    void loadMissions();

    return () => {
      isMounted = false;
    };
  }, [artist, title, description]);

  return (
    <div className="relative flex min-h-screen flex-col items-center overflow-hidden bg-black px-4 sm:px-6 lg:px-8">
      <section
        className="pointer-events-none absolute inset-y-0 left-0 z-[5] w-full bg-cover bg-left bg-no-repeat xl:w-[50%]"
        style={{ backgroundImage: `url(${imageSrc})` }}
        aria-label={`${title} cover`}
      />
      <div className="pointer-events-none absolute inset-0 z-[6] bg-black/85 xl:hidden" />
      <div className="pointer-events-none absolute inset-y-0 left-1/2 z-[8] hidden w-44 -translate-x-1/2 bg-gradient-to-r from-transparent via-black/100 to-black xl:block 2xl:w-56" />
      <div className="pointer-events-none absolute inset-0 z-[5] hidden bg-gradient-to-b from-black/15 via-black/25 to-black/55 xl:block" />
      <div className="pointer-events-none absolute inset-y-0 right-0 z-[6] hidden w-[58%] bg-black/60 sm:w-[55%] xl:block xl:w-[50%]" />
      <div className="pointer-events-none absolute inset-0 z-[14] hidden bg-gradient-to-b from-[#6f6500]/70 via-[#141300]/55 to-black/30 xl:block" />

      <main className="relative z-20 w-full">

        <div className="relative z-20 flex min-h-screen flex-col px-1 pb-8 pt-5 sm:px-4 lg:px-8 lg:pt-8">
          <header className="mt-8 w-full max-w-[620px] xl:ml-[calc(50%+1.5rem)] xl:mr-6 xl:mt-10 xl:w-[min(620px,calc(50%-3rem))]">
            <p className="text-sm text-white/70">{genre}</p>
            <h1 className="mt-2 text-xl font-semibold leading-tight text-white sm:text-2xl lg:text-2xl 2xl:text-3xl">
              {title} <span className="text-[#ffe600]">{artist}</span>
            </h1>
          </header>

          <section className="relative z-30 mt-8 w-full max-w-[620px] space-y-4 xl:ml-[calc(50%+1.5rem)] xl:mr-6 xl:mt-16 xl:w-[min(620px,calc(50%-3rem))]">
            {loading ? <p className="text-white/80">Loading missions...</p> : null}
            {error ? <p className="text-[#ffe600]">{error}</p> : null}
            {!loading && !error ? (
              <Accordion type="single" collapsible className="space-y-4">
                {missions.map((mission, index) => (
                  <AccordionItem key={`${mission.title}-${index}`} value={`mission-${index}`} >
                    <AccordionTrigger className="py-2 text-left hover:no-underline">
                      <div>
                        <h2 className="text-base font-semibold text-white sm:text-lg 2xl:text-xl">{mission.title}</h2>
                        <p className="mt-1 text-sm text-white/90 sm:text-base 2xl:text-lg">
                          <span className="font-semibold text-[#ffe600]">{mission.suggested_channel}</span>
                          <span className="text-white/70"> - {mission.effort_level}</span>
                        </p>
                      </div>
                    </AccordionTrigger>
                    <AccordionContent className="pb-3 pt-2 text-sm text-white/80 sm:text-base">
                      <p>{mission.description}</p>
                      <div className="mt-6 flex justify-end">
                        <button type="button" className="flex items-center gap-3 text-base text-[#ffe600] transition-opacity hover:opacity-85 sm:text-lg 1xl:text-1xl" >
                          <span className="inline-block h-6 w-6 rounded-full border-2 border-[#ffe600]" />
                          <span>Mark as completed</span>
                        </button>
                      </div>
                    </AccordionContent>
                  </AccordionItem>
                ))}
              </Accordion>
            ) : null}
          </section>
        </div>
      </main>
    </div>
  );
}
