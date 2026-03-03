from fastapi import APIRouter, Depends
from app.modules.users.services import UserService
from app.modules.users.schemas import UserDTO

router = APIRouter()

@router.get("/{user_id}", response_model=UserDTO)
def get_user(user_id: int, service: UserService = Depends()):
    return service.get_by_id(user_id)