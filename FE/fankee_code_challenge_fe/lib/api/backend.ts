import fs from "node:fs";
import path from "node:path";

const DEFAULT_BACKEND_URL = "http://127.0.0.1:8001";

function readBackendUrlFromRootEnv(): string | undefined {
  try {
    const envPath = path.resolve(process.cwd(), "..", "..", ".env");
    const rawEnv = fs.readFileSync(envPath, "utf8");
    const match = rawEnv.match(/^\s*APP_PORT\s*=\s*([0-9]+)\s*$/m);
    const port = match?.[1];
    if (!port) {
      return undefined;
    }
    return `http://127.0.0.1:${port}`;
  } catch {
    return undefined;
  }
}

type BackendRequestInit = Omit<RequestInit, "body"> & {
  body?: unknown;
};

export class BackendApiError extends Error {
  constructor(
    message: string,
    public readonly status: number,
    public readonly detail?: unknown,
  ) {
    super(message);
  }
}

export async function backendFetch<T>(
  path: string,
  init: BackendRequestInit = {},
): Promise<T> {
  const baseUrl =
    process.env.BE_API_BASE_URL ??
    readBackendUrlFromRootEnv() ??
    DEFAULT_BACKEND_URL;
  const url = `${baseUrl}${path}`;

  const headers = new Headers(init.headers);
  headers.set("Accept", "application/json");
  if (init.body !== undefined) {
    headers.set("Content-Type", "application/json");
  }

  const response = await fetch(url, {
    ...init,
    headers,
    cache: "no-store",
    body: init.body !== undefined ? JSON.stringify(init.body) : undefined,
  });

  const raw = await response.text();
  let parsed: unknown = undefined;
  if (raw) {
    try {
      parsed = JSON.parse(raw);
    } catch {
      parsed = raw;
    }
  }

  if (!response.ok) {
    const detail =
      typeof parsed === "object" && parsed && "detail" in parsed
        ? (parsed as { detail: unknown }).detail
        : parsed;
    throw new BackendApiError("Backend request failed", response.status, detail);
  }

  return parsed as T;
}
