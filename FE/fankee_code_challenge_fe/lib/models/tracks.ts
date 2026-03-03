export type TrackRead = {
  id: number;
  artist_name: number;
  genre: string;
  track_title: string | null;
  track_description: string | null;
  created_at: string | null;
  updated_at: string | null;
  deleted_at: string | null;
};

export type TrackVerifyPayload = {
  artist_name?: number;
};
