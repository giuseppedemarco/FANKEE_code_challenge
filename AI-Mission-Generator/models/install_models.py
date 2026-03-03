import os
from huggingface_hub import hf_hub_download
from dotenv import load_dotenv
load_dotenv()

huggingface_token = os.getenv("HUGGINGFACE_HUB_TOKEN")
if not huggingface_token:
            raise ValueError("HUGGINGFACE_HUB_TOKEN environment variable is not set")

hf_hub_download(
    repo_id="unsloth/gemma-3n-E2B-it-GGUF",
    filename="gemma-3n-E2B-it-Q4_0.gguf",
    local_dir="models/",
    token=huggingface_token
)