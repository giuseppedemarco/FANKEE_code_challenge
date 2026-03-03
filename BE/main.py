from fastapi import FastAPI
from app.api.router import api_router
from app.core.config import settings

app = FastAPI(title="FANKEE code challenge - Giuseppe De Marco")

app.include_router(api_router, prefix="/v1")

if __name__ == "__main__":
    import uvicorn

    uvicorn.run("main:app", host=settings.APP_HOST, port=settings.APP_PORT, reload=True)
