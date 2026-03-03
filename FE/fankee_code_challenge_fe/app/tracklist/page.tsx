import { Card } from "@/components/ui/card";
import { Carousel } from "motion-plus/react"

export default function Tracklist() {
    const items = [
        <Card
          genre="Genre"
          title="Cool"
          artist="Dua Lipa"
          imageSrc="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?auto=format&fit=crop&w=900&q=80"
        />
    ]

  return (
    <main className="flex min-h-screen items-start justify-center bg-gradient-to-b from-[#6f6500] via-[#141300] to-black px-5 pt-8">
        <div className="flex h-full items-start justify-center pt-20">
          <h1 className="text-[32px] text-[#ffe600]">
            Choose your track
          </h1>
      </div>
    </main>
  );
}
