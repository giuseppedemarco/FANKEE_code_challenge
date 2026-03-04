from datetime import datetime

from sqlalchemy import Integer, cast, func
from sqlalchemy.orm import Session

from app.modules.missions_completed.models import MissionCompleted
from app.modules.missions_completed.schemas import MissionCompletedCreate


class MissionCompletedRepository:
    def __init__(self, db: Session):
        self.db = db

    def create(self, payload: MissionCompletedCreate, score: int) -> MissionCompleted:
        completion = MissionCompleted(
            user_id=payload.user_id,
            track_title=payload.track_title,
            track_description=payload.track_description,
            score=score,
            created_at=datetime.now(),
        )
        self.db.add(completion)
        self.db.commit()
        self.db.refresh(completion)
        return completion

    def get_total_score_by_user_id(self, user_id: int) -> int:
        total = (
            self.db.query(
                func.coalesce(
                    func.sum(cast(MissionCompleted.score, Integer)),
                    0,
                )
            )
            .filter(
                MissionCompleted.user_id == user_id,
                MissionCompleted.deleted_at.is_(None),
            )
            .scalar()
        )
        return int(total or 0)
