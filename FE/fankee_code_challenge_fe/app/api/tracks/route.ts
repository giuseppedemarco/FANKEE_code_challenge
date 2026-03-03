import { NextResponse } from "next/server";

import { BackendApiError, backendFetch } from "@/lib/api/backend";
import { TrackRead, TrackVerifyPayload } from "@/lib/models/tracks";

export async function GET(request: Request) {
  const trackIdParam = new URL(request.url).searchParams.get("track_id");

  try {
    if (trackIdParam !== null) {
      const trackId = Number(trackIdParam);
      if (!Number.isInteger(trackId) || trackId <= 0) {
        return NextResponse.json({ error: "track_id must be a positive integer" }, { status: 400 });
      }

      const track = await backendFetch<TrackRead>(`/v1/tracks/${trackId}`, { method: "GET" });
      return NextResponse.json(track, { status: 200 });
    }

    const tracks = await backendFetch<TrackRead[]>("/v1/tracks/", { method: "GET" });
    return NextResponse.json(tracks, { status: 200 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to fetch track data", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}

export async function POST(request: Request) {
  const mode = new URL(request.url).searchParams.get("mode");
  if (mode !== "verify") {
    return NextResponse.json({ error: "Unsupported mode" }, { status: 400 });
  }

  let payload: TrackVerifyPayload;
  try {
    payload = (await request.json()) as TrackVerifyPayload;
  } catch {
    return NextResponse.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const artistName = payload.artist_name;
  if (!Number.isInteger(artistName) || (artistName as number) <= 0) {
    return NextResponse.json({ error: "artist_name must be a positive integer" }, { status: 400 });
  }

  try {
    const track = await backendFetch<TrackRead>(
      `/v1/tracks/verify?artist_name=${encodeURIComponent(String(artistName))}`,
      { method: "POST" },
    );
    return NextResponse.json(track, { status: 200 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to verify track", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}
