from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.db.session import get_db
from app.modules.users.repository import UserRepository
from app.modules.users.service import UserService
from app.modules.users.schemas import UserRead, UserCreate, UserVerifyResponse

router = APIRouter()


def get_user_repository(db: Session = Depends(get_db)) -> UserRepository:
    return UserRepository(db)


def get_user_service(repo: UserRepository = Depends(get_user_repository)) -> UserService:
    return UserService(repo)


@router.get("/{user_id}", response_model=UserRead)
def get_user(user_id: int, service: UserService = Depends(get_user_service)):
    try:
        return service.get_user(user_id)
    except ValueError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc

@router.get("/", response_model=list[UserRead])
def get_all_users(service: UserService = Depends(get_user_service)):
    return service.get_all_users()

@router.post("/", response_model=UserRead)
def create_user(payload: UserCreate, service: UserService = Depends(get_user_service)):
    try:
        return service.create_user(payload)
    except ValueError as exc:
        raise HTTPException(status_code=409, detail=str(exc)) from exc

@router.post("/verify", response_model=UserVerifyResponse)
def verify_existing_user(nickname: str, service: UserService = Depends(get_user_service)):
    return UserVerifyResponse(exists=service.verify_existing_user(nickname))
