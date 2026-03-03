"use client";

import { useEffect } from "react";
import { motion, useMotionValue, useTransform } from "motion/react";

export default function Home() {
  const progress = useMotionValue(0);
  const opacity = useTransform(progress, [0, 1], [1, 0]);
  const scale = useTransform(progress, [0, 1], [1, 0.9]);

  useEffect(() => {
    let touchStartY = 0;

    const onWheel = (event: WheelEvent) => {
      event.preventDefault();
      const next = Math.min(1, Math.max(0, progress.get() + event.deltaY * 0.0015));
      progress.set(next);
    };

    const onTouchStart = (event: TouchEvent) => {
      touchStartY = event.touches[0]?.clientY ?? 0;
    };

    const onTouchMove = (event: TouchEvent) => {
      event.preventDefault();
      const currentY = event.touches[0]?.clientY ?? touchStartY;
      const delta = touchStartY - currentY;
      touchStartY = currentY;
      const next = Math.min(1, Math.max(0, progress.get() + delta * 0.003));
      progress.set(next);
    };

    window.addEventListener("wheel", onWheel, { passive: false });
    window.addEventListener("touchstart", onTouchStart, { passive: true });
    window.addEventListener("touchmove", onTouchMove, { passive: false });

    return () => {
      window.removeEventListener("wheel", onWheel);
      window.removeEventListener("touchstart", onTouchStart);
      window.removeEventListener("touchmove", onTouchMove);
    };
  }, [progress]);

  return (
    <main className="flex h-screen items-center justify-center overflow-hidden touch-none">
      <section className="flex h-screen w-full items-center justify-center">
        <motion.img
          src="/FANKEE_logo_playground.svg"
          width={500}
          height={500}
          style={{ opacity, scale }}
          alt="FANKEE_logo_playground"
        />
      </section>
    </main>
  );
}
