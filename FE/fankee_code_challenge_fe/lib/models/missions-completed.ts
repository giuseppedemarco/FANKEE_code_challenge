export type MissionDifficulty = "Low" | "Medium" | "Hard";

export type MissionCompletedCreatePayload = {
  user_id?: number;
  track_title?: string;
  track_description?: string;
  difficulty?: MissionDifficulty;
};

export type MissionCompletedRead = {
  id: number;
  user_id: number;
  track_title: string;
  track_description: string;
  score: number;
  created_at: string;
  updated_at: string | null;
  deleted_at: string | null;
};

export type UserTotalScoreRead = {
  user_id: number;
  total_score: number;
};
