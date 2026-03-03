import { NextResponse } from "next/server";

import { BackendApiError, backendFetch } from "@/lib/api/backend";
import {
  UserCreatePayload,
  UserRead,
  UserVerifyPayload,
  UserVerifyResponse,
} from "@/lib/models/users";

export async function GET() {
  try {
    const users = await backendFetch<UserRead[]>("/v1/users/", { method: "GET" });
    return NextResponse.json(users, { status: 200 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to fetch users", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}

export async function POST(request: Request) {
  const mode = new URL(request.url).searchParams.get("mode");

  if (mode === "verify") {
    let payload: UserVerifyPayload;
    try {
      payload = (await request.json()) as UserVerifyPayload;
    } catch {
      return NextResponse.json({ error: "Invalid JSON body" }, { status: 400 });
    }

    const nickname = payload.nickname?.trim();
    if (!nickname) {
      return NextResponse.json({ error: "Nickname is required" }, { status: 400 });
    }

    try {
      const verifyResponse = await backendFetch<UserVerifyResponse>(
        `/v1/users/verify?nickname=${encodeURIComponent(nickname)}`,
        { method: "POST" },
      );
      return NextResponse.json(verifyResponse, { status: 200 });
    } catch (error) {
      if (error instanceof BackendApiError) {
        return NextResponse.json(
          { error: "Failed to verify user", detail: error.detail },
          { status: error.status },
        );
      }
      return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
    }
  }

  let payload: UserCreatePayload;
  try {
    payload = (await request.json()) as UserCreatePayload;
  } catch {
    return NextResponse.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const nickname = payload.nickname?.trim();
  const active = payload.active ?? 1;

  if (!nickname) {
    return NextResponse.json({ error: "Nickname is required" }, { status: 400 });
  }
  if (active !== 0 && active !== 1) {
    return NextResponse.json({ error: "Active must be 0 or 1" }, { status: 400 });
  }

  try {
    const createdUser = await backendFetch<UserRead>("/v1/users/", {
      method: "POST",
      body: { nickname, active },
    });
    return NextResponse.json(createdUser, { status: 201 });
  } catch (error) {
    if (error instanceof BackendApiError) {
      return NextResponse.json(
        { error: "Failed to create user", detail: error.detail },
        { status: error.status },
      );
    }
    return NextResponse.json({ error: "Unexpected error" }, { status: 500 });
  }
}
