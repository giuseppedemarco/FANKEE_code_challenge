from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    DATABASE_URL: str
    MODEL_PATH: str | None = "C:/Users/giuse/Desktop/FANKEE_code_challenge/AI-Mission-Generator/models/gemma-3n-E2B-it-Q4_0.gguf"
    APP_HOST: str = "127.0.0.1"
    APP_PORT: int = 8001

    model_config = SettingsConfigDict(
        env_file=".env",
        extra="ignore",
    )


settings = Settings()
