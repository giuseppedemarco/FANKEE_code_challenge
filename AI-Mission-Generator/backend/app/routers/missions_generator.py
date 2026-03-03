from fastapi import APIRouter, Depends, HTTPException, status
import logging
from app.services.generate_missions import MissionGeneratorService
from app.schemas.mission_generator_models import GenerateMissionsRequest, GenerateMissionsResponse, Mission
from app.services.error_handler import CustomErrorHandler
from dotenv import load_dotenv

router = APIRouter()
logger = logging.getLogger(__name__)
error_handler = CustomErrorHandler()
load_dotenv()

def get_mission_generator_service():
    service = MissionGeneratorService()
    try:
        yield service
    finally:
        service.llm_service.empty_gpu_cache(service.llm)


@router.post("/generate-missions", response_model=GenerateMissionsResponse)
async def generate_missions(
    request: GenerateMissionsRequest,
    mission_generator_service: MissionGeneratorService = Depends(get_mission_generator_service)
) -> GenerateMissionsResponse:
    """Generate fan missions based on artist and track information."""
    
    if not request.artist_name or not request.track_title:
        raise error_handler.handle_validation_error("missing required fields")
    
    try:
        logger.info(f"Generating missions for artist: {request.artist_name}, track: {request.track_title}")
        
        missions = mission_generator_service.generate_missions(
            artist_name=request.artist_name,
            track_title=request.track_title,
            track_description=request.track_description
        )
        
        if not missions:
            raise error_handler.handle_generation_failed()
        
        logger.info(f"Generated {len(missions)} missions")
        
        response = GenerateMissionsResponse(
            artist_name=request.artist_name,
            track_title=request.track_title,
            missions=[Mission(**mission) for mission in missions]
        )
        logger.info("Missions generation process completed successfully")
        return response
        
    except HTTPException:
        raise
    except ValueError as e:
        raise error_handler.handle_invalid_data(str(e))
    except Exception as e:
        raise error_handler.handle_server_error("Unexpected error generating missions", e)


@router.get("/generate_missions_health")
async def health_check():
    """Health check for the generate_missions router."""
    return {"status": "healthy", "service": "generate_missions"}