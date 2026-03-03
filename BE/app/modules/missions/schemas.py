from pydantic import BaseModel


class Mission(BaseModel):
    title: str
    description: str
    suggested_channel: str
    effort_level: str


class GenerateMissionsRequest(BaseModel):
    artist_name: str
    track_title: str
    track_description: str


class GenerateMissionsResponse(BaseModel):
    artist_name: str
    track_title: str
    missions: list[Mission]
