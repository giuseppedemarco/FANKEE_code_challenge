from datetime import datetime

from pydantic import BaseModel, ConfigDict, Field


class UserBase(BaseModel):
    nickname: str = Field(..., min_length=1, max_length=255)
    active: int = Field(default=1, ge=0, le=1)

class UserCreate(UserBase):
    pass

class UserRead(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: int
    nickname: str
    active: int
    created_at: datetime
    updated_at: datetime | None
    deleted_at: datetime | None


class UserListItem(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: int
    nickname: str
    active: int

# TODO: Aggiunta gestione dell'aggiornamento e della rimozione in futuro
