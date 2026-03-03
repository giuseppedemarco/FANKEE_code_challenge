from fastapi import Depends, HTTPException, Path, status
from sqlalchemy.orm import Session

from app.db.session import get_db
from app.modules.users.models import User


def get_user_by_id(
    user_id: int = Path(..., gt=0),
    db: Session = Depends(get_db),
) -> User:
    user = db.query(User).filter(User.id == user_id).first()

    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="User not found",
        )

    return user


def get_not_deleted_user(
    user: User = Depends(get_user_by_id),
) -> User:
    if user.deleted_at is not None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="User has been deleted",
        )
    return user