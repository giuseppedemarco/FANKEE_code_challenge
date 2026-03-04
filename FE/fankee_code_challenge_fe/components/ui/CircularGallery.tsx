"use client";

import { PointerEvent, useRef, useState } from "react";
import { motion } from "motion/react";
import { Card } from "@/components/ui/card";
import { cn } from "@/lib/utils";
import styles from "./CircularGallery.module.css";

export type CircularGalleryItem = {
  trackId: number;
  userId: number | null;
  genre: string;
  title: string;
  artist: string;
  imageSrc: string;
};

type CircularGalleryProps = {
  items: CircularGalleryItem[];
  className?: string;
};

const DRAG_STEP_PX = 120;

export default function CircularGallery({ items, className }: CircularGalleryProps) {
  const [activeIndex, setActiveIndex] = useState(0);
  const dragStateRef = useRef({
    isDragging: false,
    pointerId: -1,
    lastX: 0,
    dragAccumulator: 0,
  });
  const count = items.length;

  const moveBy = (delta: number) => {
    if (count === 0) return;
    setActiveIndex((prev) => (prev + delta + count) % count);
  };

  const onPointerDown = (event: PointerEvent<HTMLDivElement>) => {
    if (event.button !== 0) return;
    const target = event.target as HTMLElement;
    if (target.closest("[data-no-drag='true'], button, a, input, textarea, select")) return;

    dragStateRef.current = {
      isDragging: true,
      pointerId: event.pointerId,
      lastX: event.clientX,
      dragAccumulator: 0,
    };

    event.currentTarget.setPointerCapture(event.pointerId);
  };

  const onPointerMove = (event: PointerEvent<HTMLDivElement>) => {
    const dragState = dragStateRef.current;
    if (!dragState.isDragging || dragState.pointerId !== event.pointerId) return;

    const deltaX = event.clientX - dragState.lastX;
    dragState.lastX = event.clientX;
    dragState.dragAccumulator += deltaX;

    while (Math.abs(dragState.dragAccumulator) >= DRAG_STEP_PX) {
      const direction = dragState.dragAccumulator < 0 ? 1 : -1;
      moveBy(direction);
      dragState.dragAccumulator += dragState.dragAccumulator < 0 ? DRAG_STEP_PX : -DRAG_STEP_PX;
    }
  };

  const onPointerEnd = (event: PointerEvent<HTMLDivElement>) => {
    const dragState = dragStateRef.current;
    if (!dragState.isDragging || dragState.pointerId !== event.pointerId) return;

    if (event.currentTarget.hasPointerCapture(event.pointerId)) {
      event.currentTarget.releasePointerCapture(event.pointerId);
    }

    dragStateRef.current = {
      isDragging: false,
      pointerId: -1,
      lastX: 0,
      dragAccumulator: 0,
    };
  };

  return (
    <div
      className={cn(styles.circularGallery, className)}
      onPointerDown={onPointerDown}
      onPointerMove={onPointerMove}
      onPointerUp={onPointerEnd}
      onPointerCancel={onPointerEnd}
    >
      <div className={styles.stage}>
        {items.map((item, index) => {
          let relative = (index - activeIndex + count) % count;
          if (relative > count / 2) relative -= count;

          const abs = Math.abs(relative);
          const hidden = abs > 2;
          const x = relative * 230;
          const scale = 1 - abs * 0.12;
          const rotate = relative * -12;
          const opacity = hidden ? 0 : 1 - abs * 0.25;
          const zIndex = 100 - abs;

          return (
            <motion.div
              key={item.trackId}
              className={styles.trackSlot}
              initial={{ opacity: 0, y: 24, scale: 0.92 }}
              style={{
                zIndex,
                pointerEvents: hidden ? "none" : "auto",
              }}
              animate={{
                opacity,
                x,
                scale,
                rotateY: rotate,
              }}
              transition={{
                opacity: { duration: 0.24, ease: "easeOut" },
                x: { type: "spring", stiffness: 180, damping: 22 },
                scale: { duration: 0.24, ease: "easeOut" },
                rotateY: { duration: 0.24, ease: "easeOut" },
              }}
            >
              <Card
                trackId={item.trackId}
                userId={item.userId}
                genre={item.genre}
                title={item.title}
                artist={item.artist}
                imageSrc={item.imageSrc}
                className={styles.card}
              />
            </motion.div>
          );
        })}
      </div>
    </div>
  );
}
