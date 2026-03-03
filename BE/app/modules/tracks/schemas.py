from datetime import datetime

from pydantic import BaseModel, ConfigDict


class TrackRead(BaseModel):
    id: int
    artist_name: int
    genre: str | None = None
    artist_image_url: str | None = None
    track_title: str | None = None
    track_description: str | None = None
    created_at: str | None = None
    updated_at: datetime | None = None
    deleted_at: str | None = None

    model_config = ConfigDict(from_attributes=True)
