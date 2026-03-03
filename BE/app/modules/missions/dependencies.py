from functools import lru_cache

from app.modules.missions.mission_generator_service import MissionGeneratorService


@lru_cache(maxsize=1)
def get_mission_generator_service() -> MissionGeneratorService:
    return MissionGeneratorService()
