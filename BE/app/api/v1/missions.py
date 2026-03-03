from fastapi import APIRouter, Depends, HTTPException

from app.modules.missions.dependencies import get_mission_generator_service
from app.modules.missions.mission_generator_service import MissionGeneratorService
from app.modules.missions.schemas import (
    GenerateMissionsRequest,
    GenerateMissionsResponse,
    Mission,
)

router = APIRouter()


@router.post("/generate-missions", response_model=GenerateMissionsResponse)
async def generate_missions(
    payload: GenerateMissionsRequest,
    service: MissionGeneratorService = Depends(get_mission_generator_service),
) -> GenerateMissionsResponse:
    if not payload.artist_name or not payload.track_title:
        raise HTTPException(status_code=400, detail="Validation failed: missing required fields")

    try:
        missions = service.generate_missions(
            artist_name=payload.artist_name,
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

    return GenerateMissionsResponse(
        artist_name=payload.artist_name,
        track_title=payload.track_title,
        missions=[Mission(**mission) for mission in missions],
    )
