from fastapi import FastAPI
from app.api.router import api_router

app = FastAPI(title="FANKEE code challenge - Giuseppe De Marco")

app.include_router(api_router, prefix = "/api/v1")

