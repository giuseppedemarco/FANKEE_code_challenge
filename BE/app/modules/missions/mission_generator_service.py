from app.core.config import settings
from app.modules.missions.llm_service import LLMService
from app.modules.missions.schemas import GenerateMissionsResponse


class MissionGeneratorService:
    def __init__(self):
        self.llm_service = LLMService()
        self.llm_model_path = settings.MODEL_PATH
        if not self.llm_model_path:
            raise ValueError("MODEL_PATH environment variable is not set")
        self.llm = self.llm_service.get_model(self.llm_model_path)

    def generate_missions(
        self,
        artist_name: str,
        track_title: str,
        track_description: str,
    ) -> list[dict]:
        messages = [
            {
                "role": "system",
                "content": "You are an expert in creating engaging fan missions for music tracks.",
            },
            {
                "role": "user",
                "content": (
                    f"Generate 3 fan missions for the artist '{artist_name}' and the track '{track_title}'. "
                    f"The track is described as: {track_description}. "
                    "For each mission, provide a title, description, suggested channel, and effort level."
                    "suggested_channel should be one of: Instagram, TikTok, Twitter, Facebook, YouTube, In-App."
                    "effort_level should be one of: Low, Medium, High."
                ),
            },
        ]

        json_schema = GenerateMissionsResponse.model_json_schema()
        response_format = {
            "type": "json_object",
            "schema": json_schema,
        }

        response = self.llm.create_chat_completion(
            messages=messages,
            response_format=response_format,
            temperature=0.7,
        )

        content_str = response["choices"][0]["message"]["content"]
        validated_data = GenerateMissionsResponse.model_validate_json(content_str)
        return [mission.model_dump() for mission in validated_data.missions]
