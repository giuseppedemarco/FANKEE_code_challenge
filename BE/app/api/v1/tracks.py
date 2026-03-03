from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.db.session import get_db
from app.modules.tracks.repository import TrackRepository
from app.modules.tracks.schemas import TrackRead
from app.modules.tracks.service import TrackService

router = APIRouter()


def get_track_repository(db: Session = Depends(get_db)) -> TrackRepository:
    return TrackRepository(db)


def get_track_service(repo: TrackRepository = Depends(get_track_repository)) -> TrackService:
    return TrackService(repository=repo)


@router.get("/{track_id}", response_model=TrackRead)
def get_track(track_id: int, service: TrackService = Depends(get_track_service)):
    try:
        return service.get_track(track_id)
    except ValueError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc


@router.get("/", response_model=list[TrackRead])
def get_all_tracks(service: TrackService = Depends(get_track_service)):
    return service.get_all_tracks()


@router.post("/verify", response_model=TrackRead)
def verify_existing_track(
    artist_name: int,
    service: TrackService = Depends(get_track_service),
):
    try:
        return service.verify_existing_track(artist_name)
    except ValueError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc
