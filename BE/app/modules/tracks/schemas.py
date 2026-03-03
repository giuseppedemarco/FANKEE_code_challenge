from pydantic import BaseModel, Field

class TrackGenerateMissionPayload(BaseModel):
    artist_id: int
    track_title: str = Field(..., max_length=255)
    track_description: str
