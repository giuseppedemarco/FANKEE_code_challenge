"use client";

import Image from "next/image";
import { usePathname } from "next/navigation";

export default function FankeeCornerLogo() {
  const pathname = usePathname();

  if (pathname === "/") {
    return null;
  }

  return (
    <div className="pointer-events-none fixed right-6 bottom-6 z-50">
      <Image
        src="/FANKEE_logo.svg"
        alt="FANKEE"
        width={100}
        height={0}
        priority
      />
    </div>
  );
}
