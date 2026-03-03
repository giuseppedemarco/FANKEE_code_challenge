from fastapi import HTTPException

from app.modules.missions.mission_generator_service import MissionGeneratorService
from app.modules.tracks.repository import TrackRepository
from app.modules.users.service import UserService
from app.modules.tracks.schemas import TrackGenerateMissionPayload

class TrackService:
    def __init__(
        self,
        repository: TrackRepository,
        user_service: UserService,
        mission_generator_service: MissionGeneratorService,
    ):
        self.repository = repository
        self.user_service = user_service
        self.mission_generator_service = mission_generator_service

    def get_track(self, track_id: int):
        return self.repository.get_by_id(track_id)

    def get_all_tracks(self):
        return self.repository.list()

    def verify_existing_track(self, nickname: str):
        return self.repository.get_by_nickname(nickname)
        
    async def generate_missions(self, payload: TrackGenerateMissionPayload):
        user = self.user_service.get_user(payload.artist_id)
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        try:
            missions = self.mission_generator_service.generate_missions(
                artist_name=user.nickname,
                track_title=payload.track_title,
                track_description=payload.track_description,
            )
        except ValueError as exc:
            raise HTTPException(status_code=422, detail=f"Invalid data format: {exc}") from exc
        except Exception as exc:
            raise HTTPException(
                status_code=500,
                detail="An unexpected error occurred. Please try again later.",
            ) from exc

        if not missions:
            raise HTTPException(status_code=500, detail="Failed to generate missions data")

        return {
            "artist_name": user.nickname,
            "track_title": payload.track_title,
            "missions": missions,
        }

    
