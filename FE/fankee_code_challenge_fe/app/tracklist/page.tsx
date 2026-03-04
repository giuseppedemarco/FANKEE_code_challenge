"use client";

import { useEffect, useState } from "react";
import { motion } from "motion/react";
import CircularGallery from "@/components/ui/CircularGallery";
import { TrackRead } from "@/lib/models/tracks";
import { UserRead } from "@/lib/models/users";

type TrackCardItem = {
  id: number;
  genre: string;
  title: string;
  artist: string;
  imageSrc: string;
};

export default function Tracklist() {
  const [items, setItems] = useState<TrackCardItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    let isMounted = true;

    const loadItems = async () => {
      setLoading(true);
      setError("");

      try {
        const [tracksRes, usersRes] = await Promise.all([
          fetch("/api/tracks", { cache: "no-store" }),
          fetch("/api/users", { cache: "no-store" }),
        ]);

        if (!tracksRes.ok || !usersRes.ok) {
          throw new Error("Failed to load tracks data");
        }

        const [tracks, users] = (await Promise.all([tracksRes.json(), usersRes.json()])) as [
          TrackRead[],
          UserRead[],
        ];

        const userById = new Map<number, string>(users.map((user) => [user.id, user.nickname]));

        const mappedItems: TrackCardItem[] = tracks.map((track) => ({
          id: track.id,
          genre: track.genre ?? "Unknown genre",
          title: track.track_title ?? "Untitled track",
          artist: userById.get(track.artist_name) ?? `Artist #${track.artist_name}`,
          imageSrc: track.artist_image_url ?? "/FANKEE_logo.svg",
        }));

        if (isMounted) {
          setItems(mappedItems);
        }
      } catch {
        if (isMounted) {
          setError("Error while loading tracks.");
          setItems([]);
        }
      } finally {
        if (isMounted) {
          setLoading(false);
        }
      }
    };

    void loadItems();

    return () => {
      isMounted = false;
    };
  }, []);

  return (
    <div className="relative flex min-h-screen flex-col items-center overflow-hidden bg-gradient-to-b from-[#6f6500] via-[#141300] to-black px-4 sm:px-6 lg:px-8">
      <motion.div
        className="pointer-events-none absolute left-1/2 top-6 z-20 -translate-x-1/2 sm:top-8"
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.3, delay: 0.1, ease: "easeOut" }}
      >
        <h1 className="pt-1 text-center text-2xl text-[#ffe600] sm:pt-2 sm:text-3xl md:pt-4 md:text-2xl">Choose your track</h1>
      </motion.div>
      {loading ? (
        <motion.div
          className="flex min-h-screen w-full items-center justify-center"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.25 }}
        >
          <p className="text-sm text-[#ffe600] sm:text-base">Loading tracks...</p>
        </motion.div>
      ) : null}
      {error ? (
        <motion.div
          className="flex min-h-screen w-full items-center justify-center"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.25 }}
        >
          <p className="text-center text-sm text-[#ffe600] sm:text-base">{error}</p>
        </motion.div>
      ) : null}
      {!loading && !error ? (
        <motion.div
          className="flex min-h-screen w-full max-w-[1400px] items-center justify-center"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.35, delay: 0.15, ease: "easeOut" }}
        >
          <CircularGallery className = "z-[10]" items={items} />
        </motion.div>
      ) : null}
    </div>
  );
}
