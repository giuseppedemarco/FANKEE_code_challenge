from fastapi import APIRouter
from app.api.v1 import missions, tracks, users

router = APIRouter()
router.include_router(users.router, prefix="/users", tags=["users"])
router.include_router(tracks.router, prefix="/tracks", tags=["tracks"])
router.include_router(missions.router, prefix="/missions", tags=["missions"])
