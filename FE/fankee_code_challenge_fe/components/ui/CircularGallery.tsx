"use client";

import { useState, WheelEvent } from "react";
import { motion } from "motion/react";
import { Card } from "@/components/ui/card";
import styles from "./CircularGallery.module.css";

export type CircularGalleryItem = {
  id: number;
  genre: string;
  title: string;
  artist: string;
  imageSrc: string;
};

type CircularGalleryProps = {
  items: CircularGalleryItem[];
};

export default function CircularGallery({ items }: CircularGalleryProps) {
  const [activeIndex, setActiveIndex] = useState(0);
  const count = items.length;

  const moveBy = (delta: number) => {
    if (count === 0) return;
    setActiveIndex((prev) => (prev + delta + count) % count);
  };

  const onWheel = (event: WheelEvent<HTMLDivElement>) => {
    event.preventDefault();
    const direction = event.deltaY > 0 ? 1 : -1;
    moveBy(direction);
  };

  return (
    <div className={styles.circularGallery} onWheel={onWheel}>
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
              key={item.id}
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
