from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.exceptions import RequestValidationError
from contextlib import asynccontextmanager
import logging

from app.routers import missions_generator
from app.services.error_handler import request_validation_error_handler

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Application lifespan events"""
    logger.info("Starting AI Fan Mission Generator API")
    yield
    logger.info("Shutting down AI Fan Mission Generator API")

app = FastAPI(
    title="AI Fan Mission Generator API",
    description="Generate AI-powered fan missions for various media.",
    version="1.0.0",
    lifespan=lifespan
)

app.add_exception_handler(RequestValidationError, request_validation_error_handler)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(missions_generator.router, prefix="/api", tags=["api"])

@app.get("/")
async def root():
    """Root endpoint"""
    return {"message": "AI Fan Mission Generator", "version": "1.0.0"}

@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "healthy", "service": "AI Fan Mission Generator"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )