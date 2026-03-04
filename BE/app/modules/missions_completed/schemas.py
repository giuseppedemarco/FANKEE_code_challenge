from datetime import datetime

from pydantic import BaseModel, ConfigDict, Field, field_validator


class MissionCompletedCreate(BaseModel):
    user_id: int = Field(..., gt=0)
    track_title: str = Field(..., min_length=1, max_length=255)
    track_description: str = Field(..., min_length=1, max_length=255)
    difficulty: str = Field(..., min_length=3, max_length=6)

    @field_validator("difficulty")
    @classmethod
    def validate_difficulty(cls, value: str) -> str:
        normalized = value.strip().lower()
        allowed = {"low", "medium", "hard"}
        if normalized not in allowed:
            raise ValueError("difficulty must be one of: Low, Medium, Hard")
        return normalized.capitalize()


class MissionCompletedRead(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: int
    user_id: int
    track_title: str
    track_description: str
    score: int
    created_at: datetime
    updated_at: datetime | None
    deleted_at: datetime | None


class UserTotalScoreRead(BaseModel):
    user_id: int
    total_score: int
