from datetime import datetime

from sqlalchemy.orm import Session

from app.modules.users.models import User
from app.modules.users.schemas import UserCreate


class UserRepository:
    def __init__(self, db: Session):
        self.db = db

    #Permette di cercare un utente tramite il suo ID
    def get_by_id(self, user_id: int) -> User | None:
        return (
            self.db.query(User)
            .filter(User.id == user_id)
            .first()
        )

    #Permette di cercare un utente tramite il suo nickname
    def get_by_nickname(self, nickname: str) -> User | None:
        return (
            self.db.query(User)
            .filter(User.nickname == nickname)
            .first()
        )


    # Restituisce la lista degli utenti non eliminati con paginazione
    def list(self, skip: int = 0, limit: int = 100) -> list[User]:
        return (
            self.db.query(User)
            .filter(User.deleted_at.is_(None))
            .offset(skip)
            .limit(limit)
            .all()
        )


    #Permette la creazione di un utente
    def create(self, payload: UserCreate) -> User:
        user = User(
            nickname=payload.nickname,
            active=payload.active,
            created_at=datetime.now(),
        )
        self.db.add(user)
        self.db.commit()
        self.db.refresh(user)
        return user

    #TODO: Implementare possibilità di rimozione e aggiornamento dell'utente (in questa fase non vengono aggiunte in quanto
    #non abbiamo previsto una sezione di Authetication ne rimozione del profilo utente una volta creato)
