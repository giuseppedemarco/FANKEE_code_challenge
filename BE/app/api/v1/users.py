from fastapi import APIRouter, Depends
from app.modules.users.services import UserService
from app.modules.users.schemas import UserDTO

router = APIRouter()

@router.get("/{user_id}", response_model=UserDTO)
def get_user(user_id: int, service: UserService = Depends()):
    return service.get_by_id(user_id)

@router.get("/", response_model=list[UserDTO])
def get_all_users(service: UserService = Depends()):
    return service.get_all_users()

@router.post("/", response_model=UserDTO)
def create_user(payload: UserCreate, service: UserService = Depends()):
    return service.create_user(payload)

@router.post("/verify", response_model=UserDTO)
def verify_existing_user(nickname: str, service: UserService = Depends()):
    return service.verify_existing_user(nickname)