from app.modules.users.repository import UserRepository

class UserService:
    def __init__(self, repo: UserRepository):
        self.repo = repo

    def get_user(self, user_id: int):
        user = self.repo.get_by_id(user_id)
        if not user:
            raise ValueError("User not found")
        return user

    def get_all_users(self, skip: int = 0, limit: int = 100):
        return self.repo.list(skip, limit)

    def create_user(self, payload: UserCreate):
        user = self.repo.get_by_nickname(payload.nickname)
        if user:
            raise ValueError("User already exists")
        return self.repo.create(payload)

    def verify_existing_user(self, nickname: str):
        user = self.repo.get_by_nickname(nickname)
        if not user:
            raise ValueError("User not found")
        if user.active != 1:
            raise ValueError("User has been deleted")
        return user