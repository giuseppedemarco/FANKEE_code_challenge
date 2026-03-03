from datetime import datetime

from sqlalchemy import DateTime, Integer, String, Text, func
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base

#Creato partendo dalla tabella del DB

class Track(Base):
    __tablename__ = "tracks"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    artist_name: Mapped[int] = mapped_column(Integer, nullable=False)
    track_title: Mapped[str] = mapped_column(String(255), nullable=True)
    track_description: Mapped[str] = mapped_column(Text, nullable=True)
    
    created_at: Mapped[str] = mapped_column(String(255), nullable=True)
    updated_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True, onupdate=func.now())
    deleted_at: Mapped[str | None] = mapped_column(String(255), nullable=True)
