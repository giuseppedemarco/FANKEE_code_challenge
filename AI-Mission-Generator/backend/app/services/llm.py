from llama_cpp import Llama
from llama_cpp.llama_cpp import llama_backend_free
import torch
import gc
import logging

logger = logging.getLogger(__name__)


class LLMService:
    """Service for interacting and managing Large Language Models (LLMs)."""

    def get_model(self, model_path: str) -> Llama:
        return Llama(
            model_path=model_path,
            n_gpu_layers=-1,
            n_ctx=2048,
            verbose=False,
        )
        
    def _detect_device(self) -> str:
        """Detects the available device for model inference."""
        if torch.cuda.is_available():
            return "cuda"
        elif torch.mps.is_available():
            return "mps"
        else:
            return "cpu"
    
    def empty_gpu_cache(self, model: Llama) -> None:
        """Clears the GPU cache to free up memory."""
        model.close()
        llama_backend_free()
        gc.collect()
        
        if self._detect_device() == "mps":
            torch.mps.empty_cache()
        elif self._detect_device() == "cuda":
            torch.cuda.empty_cache()
