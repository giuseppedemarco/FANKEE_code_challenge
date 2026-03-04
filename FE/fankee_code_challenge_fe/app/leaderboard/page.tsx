"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { UserTotalScoreRead } from "@/lib/models/missions-completed";
import { UserRead } from "@/lib/models/users";

type LeaderboardItem = {
  userId: number;
  nickname: string;
  totalScore: number;
};

export default function Leaderboard() {
  const router = useRouter();
  const [topThree, setTopThree] = useState<LeaderboardItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const currentUserId = Number(
    typeof window !== "undefined" ? window.localStorage.getItem("fankee_user_id") : null,
  );

  useEffect(() => {
    let isMounted = true;

    const loadLeaderboard = async () => {
      setLoading(true);
      setError("");

      try {
        const usersRes = await fetch("/api/users", { cache: "no-store" });
        if (!usersRes.ok) {
          throw new Error("Failed to fetch users.");
        }

        const users = (await usersRes.json()) as UserRead[];

        const scores = await Promise.all(
          users.map(async (user) => {
            try {
              const scoreRes = await fetch(`/api/missions-completed?user_id=${user.id}`, { cache: "no-store" });
              if (!scoreRes.ok) {
                return { userId: user.id, nickname: user.nickname, totalScore: 0 };
              }

              const scoreData = (await scoreRes.json()) as UserTotalScoreRead;
              return { userId: user.id, nickname: user.nickname, totalScore: scoreData.total_score ?? 0 };
            } catch {
              return { userId: user.id, nickname: user.nickname, totalScore: 0 };
            }
          }),
        );

        const top = scores
          .sort((a, b) => b.totalScore - a.totalScore)
          .slice(0, 3);

        if (isMounted) {
          setTopThree(top);
        }
      } catch (requestError) {
        if (isMounted) {
          const message = requestError instanceof Error ? requestError.message : "Error while loading leaderboard.";
          setError(message);
          setTopThree([]);
        }
      } finally {
        if (isMounted) {
          setLoading(false);
        }
      }
    };

    void loadLeaderboard();

    return () => {
      isMounted = false;
    };
  }, []);

  return (
    <main className="flex min-h-screen flex-col items-center justify-center bg-black px-6 text-center">
      {loading ? <p className="text-[#ffe600]">Loading leaderboard...</p> : null}
      {error ? <p className="text-[#ffe600]">{error}</p> : null}

      {!loading && !error ? (
        <section className="flex flex-col items-center gap-3">
          {topThree.map((entry, index) => (
            <p
              key={entry.userId}
              className={`text-xl text-[#ffe600] ${entry.userId === currentUserId ? "font-bold" : "font-normal"}`}
            >
              {index + 1}. {entry.nickname}
            </p>
          ))}
        </section>
      ) : null}

      <button
        type="button"
        onClick={() => {
          if (window.history.length > 1) {
            router.back();
            return;
          }
          router.push("/tracklist");
        }}
        className="mt-8 rounded-full border border-[#ffe600] px-6 py-2 text-[#ffe600] transition-opacity hover:opacity-85"
      >
        Back
      </button>
    </main>
  );
}
