from fastapi import APIRouter
from app.api.v1 import users, tracks

router = APIRouter()
router.include_router(users.router, prefix="/users", tags=["users"])
router.include_router(tracks.router, prefix="/tracks", tags=["tracks"])