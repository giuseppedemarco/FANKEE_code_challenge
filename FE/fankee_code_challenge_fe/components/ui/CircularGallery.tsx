"use client";

import { useState, WheelEvent } from "react";
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
            <div
              key={item.id}
              className={styles.trackSlot}
              style={{
                transform: `translateX(${x}px) scale(${scale}) rotateY(${rotate}deg)`,
                opacity,
                zIndex,
                pointerEvents: hidden ? "none" : "auto",
              }}
            >
              <Card
                genre={item.genre}
                title={item.title}
                artist={item.artist}
                imageSrc={item.imageSrc}
                className={styles.card}
              />
            </div>
          );
        })}
      </div>
    </div>
  );
}
