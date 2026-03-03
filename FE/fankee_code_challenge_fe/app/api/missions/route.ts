import { NextResponse } from "next/server";

import { BackendApiError, backendFetch } from "@/lib/api/backend";
import {
  GenerateMissionsPayload,
  GenerateMissionsResponse,
} from "@/lib/models/missions";

export async function POST(request: Request) {
  let payload: GenerateMissionsPayload;
  try {
    payload = (await request.json()) as GenerateMissionsPayload;
  } catch {
    return NextResponse.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const artist_name = payload.artist_name?.trim();
  const track_title = payload.track_title?.trim();
  const track_description = payload.track_description?.trim();

  if (!artist_name || !track_title || !track_description) {
    return NextResponse.json(
      {
        error: "artist_name, track_title and track_description are required",
      },
      { status: 400 },
    );
  }

  try {
    const missions = await backendFetch<GenerateMissionsResponse>(
      "/v1/missions/generate-missions",
      {
        method: "POST",
        body: {
          artist_name,
          track_title,
          track_description,
        },
      },
    );
    return NextResponse.json(missions, { status: 200 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to generate missions", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}
