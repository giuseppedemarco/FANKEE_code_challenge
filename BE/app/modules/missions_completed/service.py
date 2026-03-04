from app.modules.missions_completed.repository import MissionCompletedRepository
from app.modules.missions_completed.schemas import MissionCompletedCreate


class MissionCompletedService:
    SCORE_BY_DIFFICULTY = {
        "low": 1,
        "medium": 2,
        "hard": 3,
    }

    def __init__(self, repo: MissionCompletedRepository):
        self.repo = repo

    def create_mission_completed(self, payload: MissionCompletedCreate):
        difficulty = payload.difficulty.strip().lower()
        score = self.SCORE_BY_DIFFICULTY.get(difficulty)
        if score is None:
            raise ValueError("Invalid difficulty")
        return self.repo.create(payload, score)

    def get_user_total_score(self, user_id: int) -> int:
        return self.repo.get_total_score_by_user_id(user_id)
