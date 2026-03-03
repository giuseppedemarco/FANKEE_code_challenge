# AI-Fan-Mission-Generator

## Good To Know

This project uses open-weight models from Hugging Face and requires local model installation.

## How to Use

1. Create a `.env` file based on `.env.example`
    1. In the [Hugging Face website](https://huggingface.co/), create a token (Fine-grained, no specific permissions required)
    2. In the `.env` file, set the `HUGGINGFACE_HUB_TOKEN` variable to the token you created

2. Set up a virtual environment:
     ```bash
     python3 -m venv venv
     source venv/bin/activate  # On Windows: venv\Scripts\activate
     ```

3. Install dependencies: `pip install -r requirements.txt`

4. Install the model from the AI-Mission-Generator folder:
     ```bash
     python3 models/install_models.py
     ```

5. In the `.env` file, set the `MODEL_PATH` variable to the path where the model was installed (Use the absolute path, e.g. `/Users/.../challenges/AI-Mission-Generator/models/model_name.gguf`)

6. Start the FastAPI server:
     ```bash
     cd backend
     python3 main.py
     ```

### Available Endpoints

**Generate Mission**
- **Endpoint**: `POST http://localhost:8000/api/generate-missions`
- **Headers**: `Content-Type: application/json`
- **Body**:
    ```json
    {
        "artist_name": "Luna Waves",
        "track_title": "Midnight Echoes",
        "track_description": "Dreamy indie-pop track with a strong chorus and nostalgic vibe."
    }
    ```
