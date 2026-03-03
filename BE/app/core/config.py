from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    DATABASE_URL="mysql+pymysql://root:password@localhost:3306/fankee_code_challenge"
    AI_MISSION_GENERATOR_URL: str = "http://localhost:8000"

    model_config = SettingsConfigDict(
        env_file=".env",
        extra="ignore",
    )


settings = Settings()