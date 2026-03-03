import gc

import torch
from llama_cpp import Llama
from llama_cpp.llama_cpp import llama_backend_free


class LLMService:
    def get_model(self, model_path: str) -> Llama:
        return Llama(
            model_path=model_path,
            n_gpu_layers=-1,
            n_ctx=2048,
            verbose=False,
        )

    def _detect_device(self) -> str:
        if torch.cuda.is_available():
            return "cuda"
        if torch.mps.is_available():
            return "mps"
        return "cpu"

    def empty_gpu_cache(self, model: Llama) -> None:
        model.close()
        llama_backend_free()
        gc.collect()

        device = self._detect_device()
        if device == "mps":
            torch.mps.empty_cache()
        elif device == "cuda":
            torch.cuda.empty_cache()
