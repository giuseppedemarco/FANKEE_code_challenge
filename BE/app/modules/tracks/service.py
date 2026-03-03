from fastapi import HTTPException
import httpx
from app.modules.tracks.repository import TrackRepository
from app.modules.users.service import UserService
from app.modules.tracks.schemas import TrackGenerateMissionPayload
from app.core.config import settings

class TrackService:
    def __init__(self, repository: TrackRepository, user_service: UserService):
        self.repository = repository
        self.user_service = user_service

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
        
        external_payload = {
            "artist_name": user.nickname,
            "track_title": payload.track_title,
            "track_description": payload.track_description
        }
        
        url = f"{settings.AI_MISSION_GENERATOR_URL}/api/generate-missions"
        async with httpx.AsyncClient() as client:
            try:
                response = await client.post(url, json=external_payload)
                response.raise_for_status()
                return response.json()
            except httpx.HTTPStatusError as e:
                raise HTTPException(status_code=e.response.status_code, detail=f"External API error: {e.response.text}")
            except httpx.RequestError as e:
                raise HTTPException(status_code=500, detail=f"Failed to reach external API: {str(e)}")

    