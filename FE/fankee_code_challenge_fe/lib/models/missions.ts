export type Mission = {
  title: string;
  description: string;
  suggested_channel: string;
  effort_level: string;
};

export type GenerateMissionsPayload = {
  artist_name?: string;
  track_title?: string;
  track_description?: string;
};

export type GenerateMissionsResponse = {
  artist_name: string;
  track_title: string;
  missions: Mission[];
};
