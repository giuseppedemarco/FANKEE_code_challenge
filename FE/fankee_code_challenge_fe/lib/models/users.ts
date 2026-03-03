export type UserRead = {
  id: number;
  nickname: string;
  active: number;
  created_at: string;
  updated_at: string | null;
  deleted_at: string | null;
};

export type UserCreatePayload = {
  nickname?: string;
  active?: number;
};

export type UserVerifyPayload = {
  nickname?: string;
};

export type UserVerifyResponse = {
  exists: boolean;
};

export type UserResolveSource = "existing" | "created";
