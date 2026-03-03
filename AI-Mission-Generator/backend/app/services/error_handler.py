import logging
from fastapi import HTTPException, status
from fastapi.responses import JSONResponse
from fastapi.requests import Request
from fastapi.exceptions import RequestValidationError

logger = logging.getLogger(__name__)


class CustomErrorHandler:
    """Centralized error handler for the application"""
    
    @staticmethod
    def handle_validation_error(error_details: str) -> HTTPException:
        """Handles input validation errors"""
        logger.warning(f"Validation error: {error_details}")
        return HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Validation failed: {error_details}"
        )
    
    @staticmethod
    def handle_not_found(resource: str) -> HTTPException:
        """Handles resource not found"""
        logger.warning(f"Resource not found: {resource}")
        return HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"{resource} not found"
        )
    
    @staticmethod
    def handle_invalid_data(error_message: str) -> HTTPException:
        """Handles invalid data"""
        logger.error(f"Invalid data format: {error_message}")
        return HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=f"Invalid data format: {error_message}"
        )
    
    @staticmethod
    def handle_server_error(error_message: str, exc: Exception = None) -> HTTPException:
        """Handles generic server errors"""
        logger.error(f"Server error: {error_message}", exc_info=exc)
        return HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="An unexpected error occurred. Please try again later."
        )
    
    @staticmethod
    def handle_generation_failed() -> HTTPException:
        """Handles generation failure"""
        logger.error("Mission generator returned empty result")
        return HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Failed to generate missions data"
        )


async def request_validation_error_handler(request: Request, exc: RequestValidationError):
    """Global handler for Pydantic validation errors"""
    logger.warning(f"Request validation failed for {request.url}: {exc.errors()}")
    return JSONResponse(
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
        content={
            "detail": "Request validation failed",
            "errors": [
                {
                    "field": ".".join(str(x) for x in error["loc"][1:]),
                    "message": error["msg"]
                }
                for error in exc.errors()
            ]
        }
    )