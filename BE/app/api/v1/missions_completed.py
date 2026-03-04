from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.db.session import get_db
from app.modules.missions_completed.repository import MissionCompletedRepository
from app.modules.missions_completed.schemas import (
    MissionCompletedCreate,
    MissionCompletedRead,
    UserTotalScoreRead,
)
from app.modules.missions_completed.service import MissionCompletedService

router = APIRouter()


def get_mission_completed_repository(db: Session = Depends(get_db)) -> MissionCompletedRepository:
    return MissionCompletedRepository(db)


def get_mission_completed_service(
    repo: MissionCompletedRepository = Depends(get_mission_completed_repository),
) -> MissionCompletedService:
    return MissionCompletedService(repo)


@router.post("/", response_model=MissionCompletedRead)
def create_mission_completed(
    payload: MissionCompletedCreate,
    service: MissionCompletedService = Depends(get_mission_completed_service),
):
    try:
        return service.create_mission_completed(payload)
    except ValueError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.get("/users/{user_id}/total-score", response_model=UserTotalScoreRead)
def get_user_total_score(
    user_id: int,
    service: MissionCompletedService = Depends(get_mission_completed_service),
):
    total_score = service.get_user_total_score(user_id)
    return UserTotalScoreRead(user_id=user_id, total_score=total_score)
