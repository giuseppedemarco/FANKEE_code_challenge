from pydantic import BaseModel


class Mission(BaseModel):
    """Model representing a fan mission."""
    title: str
    description: str
    suggested_channel: str
    effort_level: str


class GenerateMissionsRequest(BaseModel):
    """Request model for generating missions."""
    artist_name: str
    track_title: str
    track_description: str


class GenerateMissionsResponse(BaseModel):
    """Response model for generated missions."""
    artist_name: str
    track_title: str
    missions: list[Mission]