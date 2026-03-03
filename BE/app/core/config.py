from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    DATABASE_URL: str = "mysql+pymysql://root:password@localhost:3306/fankee_code_challenge"
    MODEL_PATH: str | None = "C:/Users/giuse/Desktop/FANKEE_code_challenge/AI-Mission-Generator/models/gemma-3n-E2B-it-Q4_0.gguf"

    model_config = SettingsConfigDict(
        env_file=".env",
        extra="ignore",
    )


settings = Settings()
