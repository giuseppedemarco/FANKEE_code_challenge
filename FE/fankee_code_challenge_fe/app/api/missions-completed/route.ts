import { NextResponse } from "next/server";

import { BackendApiError, backendFetch } from "@/lib/api/backend";
import {
  MissionCompletedCreatePayload,
  MissionCompletedRead,
  UserTotalScoreRead,
} from "@/lib/models/missions-completed";

export async function GET(request: Request) {
  const userIdParam = new URL(request.url).searchParams.get("user_id");
  const userId = Number(userIdParam);

  if (!Number.isInteger(userId) || userId <= 0) {
    return NextResponse.json({ error: "user_id must be a positive integer" }, { status: 400 });
  }

  try {
    const response = await backendFetch<UserTotalScoreRead>(
      `/v1/missions-completed/users/${userId}/total-score`,
      { method: "GET" },
    );
    return NextResponse.json(response, { status: 200 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to fetch user total score", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}

export async function POST(request: Request) {
  let payload: MissionCompletedCreatePayload;
  try {
    payload = (await request.json()) as MissionCompletedCreatePayload;
  } catch {
    return NextResponse.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const user_id = payload.user_id;
  const track_title = payload.track_title?.trim();
  const track_description = payload.track_description?.trim();
  const difficulty = payload.difficulty?.trim();

  if (!Number.isInteger(user_id) || (user_id as number) <= 0) {
    return NextResponse.json({ error: "user_id must be a positive integer" }, { status: 400 });
  }
  if (!track_title) {
    return NextResponse.json({ error: "track_title is required" }, { status: 400 });
  }
  if (!track_description) {
    return NextResponse.json({ error: "track_description is required" }, { status: 400 });
  }
  if (!difficulty) {
    return NextResponse.json({ error: "difficulty is required" }, { status: 400 });
  }

  try {
    const response = await backendFetch<MissionCompletedRead>("/v1/missions-completed/", {
      method: "POST",
      body: {
        user_id,
        track_title,
        track_description,
        difficulty,
      },
    });
    return NextResponse.json(response, { status: 201 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to save mission completed", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}
