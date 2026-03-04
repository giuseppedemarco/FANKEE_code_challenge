import type { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "FANKEE Playground",
    short_name: "FANKEE",
    description: "FANKEE CODE CHALLENGE by Giuseppe De Marco",
    start_url: "/",
    scope: "/",
    display: "standalone",
    background_color: "#000000",
    theme_color: "#000000",
    icons: [
      {
        src: "/FANKEE_logo.svg",
        sizes: "192x192",
        type: "image/svg+xml",
      },
      {
        src: "/FANKEE_logo.svg",
        sizes: "512x512",
        type: "image/svg+xml",
      },
    ],
  };
}
