from fastapi import APIRouter
from app.api.v1 import missions, missions_completed, tracks, users

router = APIRouter()
router.include_router(users.router, prefix="/users", tags=["users"])
router.include_router(tracks.router, prefix="/tracks", tags=["tracks"])
router.include_router(missions.router, prefix="/missions", tags=["missions"])
router.include_router(
    missions_completed.router,
    prefix="/missions-completed",
    tags=["missions-completed"],
)
