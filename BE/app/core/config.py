from pathlib import Path

from pydantic_settings import BaseSettings, SettingsConfigDict


ROOT_DIR = Path(__file__).resolve().parents[3]


class Settings(BaseSettings):
    DATABASE_URL: str
    MODEL_PATH: str | None = str(ROOT_DIR / "models" / "gemma-3n-E2B-it-Q4_0.gguf")
    APP_HOST: str = "127.0.0.1"
    APP_PORT: int = 8001

    model_config = SettingsConfigDict(
        env_file=str(ROOT_DIR / ".env"),
        extra="ignore",
    )


settings = Settings()
