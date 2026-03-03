from sqlalchemy.orm import Session

from app.modules.tracks.models import Track


class TrackRepository:
    def __init__(self, db: Session):
        self.db = db

    def get_by_id(self, track_id: int) -> Track | None:
        return (
            self.db.query(Track)
            .filter(Track.id == track_id)
            .first()
        )

    def get_by_artist_name(self, artist_name: int) -> Track | None:
        return (
            self.db.query(Track)
            .filter(Track.artist_name == artist_name)
            .first()
        )

    def list(self, skip: int = 0, limit: int = 100) -> list[Track]:
        return (
            self.db.query(Track)
            .filter(Track.deleted_at.is_(None))
            .offset(skip)
            .limit(limit)
            .all()
        )
