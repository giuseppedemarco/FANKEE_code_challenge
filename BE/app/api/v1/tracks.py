from fastapi import APIRouter, Depends
from app.modules.tracks.service import TrackService
from app.modules.tracks.repository import TrackRepository
from app.modules.users.service import UserService
from app.modules.users.repository import UserRepository
from sqlalchemy.orm import Session
from app.db.session import get_db
from app.modules.tracks.schemas import TrackGenerateMissionPayload

router = APIRouter()

def get_track_repository(db: Session = Depends(get_db)) -> TrackRepository:
    return TrackRepository(db)

def get_user_repository(db: Session = Depends(get_db)) -> UserRepository:
    return UserRepository(db)

def get_user_service(repo: UserRepository = Depends(get_user_repository)) -> UserService:
    return UserService(repo)

def get_track_service(
    repo: TrackRepository = Depends(get_track_repository),
    user_service: UserService = Depends(get_user_service)
) -> TrackService:
    return TrackService(repo=repo, user_service=user_service)

@router.post("/generate-missions")
async def generate_missions(
    payload: TrackGenerateMissionPayload, 
    service: TrackService = Depends(get_track_service)
):
    return await service.generate_missions(payload)
