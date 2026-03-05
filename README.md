<div style="display:flex; justify-content:center; align-items:center; width:100%;">
  <img src="./FE/fankee_code_challenge_fe/public/FANKEE_logo_playground.svg" alt="FANKEE Playground Logo" style="width:450px; max-width:110vw; height:auto; display:block; margin:0 auto;"/>
</div>
_________________________

**UX/UI**

Fankee Playground is a music playground app where users pick a track and complete short “missions”. The UX/UI should feel trustworthy and user-centered, aligning with common streaming habits: 
- fast track selection,
- clear progress,
- leaderboard
Use accessible, high-contrast colors (often optimized for dark mode) and consistent UI states to reinforce reliability. To boost engagement, rely on validated UI principles: clear visual hierarchy (reduce choice overload), immediate feedback (micro-interactions), easy-to-tap controls, progress indicators, and lightweight personalization missions feel rewarding without adding friction.

Here are some mock-up made for FANKEE Playground application made with FIGMA:
<div style="display: flex; flex-wrap: wrap; gap: 16px; justify-content: center;">

  <img src="https://github.com/user-attachments/assets/20eb931a-bd55-4a71-a19b-73548dfb2db6" alt="image" style="width: 31%; max-width: 300px; height: auto;" />
  <img src="https://github.com/user-attachments/assets/50f28f93-3664-4807-a530-79061ab0507e" alt="image" style="width: 31%; max-width: 300px; height: auto;" />
  <img src="https://github.com/user-attachments/assets/c2883a15-8b06-4290-9cd6-a4bb59374668" alt="image" style="width: 31%; max-width: 300px; height: auto;" />

  <img src="https://github.com/user-attachments/assets/3e44abc4-e6c4-4a99-a3c6-646467685721" alt="image" style="width: 31%; max-width: 300px; height: auto;" />
  <img src="https://github.com/user-attachments/assets/3f1558d3-db93-4fc4-b332-58cf27128f67" alt="image" style="width: 31%; max-width: 300px; height: auto;" />
  <img src="https://github.com/user-attachments/assets/f05f6a54-cc49-49df-b5ba-dfe25c77df1f" alt="image" style="width: 31%; max-width: 300px; height: auto;" />

</div>

_________________

**Good To Know About Backend**
_________________________

At the beginning, having a separated AI Service allowed clear separation between the logic for mission generation and the rest of application's business logic. 
This made the AI component easier to test independently and allowed it to evolve as a standalone service. However, given the limited scope of this type of challenge and the fact that there is essentially only one AI request, 
introducing two backends added unnecessary complexity, in this case.

For this reason, I decided to integrate the AI Back-end directly into the main Back-end. This choice brought several advantages:
- Reduced architectural complexity: instead of a Micro-Backends architecture i choose for a centralized backend
- Easier debugging and tracing, since the entire workflow is centralized

Of course, this decision also involves some trade-offs:
- it reduces part of the modularity that a separate service provides
- it increases the coupling between the AI component and the main Back-end

In summary, merging the AI Back-end into the main backend was a choice aimed at prioritizing simplicity, operational efficiency, and lower integration overhead, 
while accepting a trade-off in terms of service separation and independence. It is a coherent decision, especially in contexts where the AI module is not meant to be a fully autonomous microservice, 
but rather an internal feature of the main application flow.

Of coure, in projects with multiple AI-related services, or in large-scale applications, a more distributed architecture is often preferable. 
In such cases, an approach based on Micro-Frontends and Micro-Backends can provide better scalability, clearer separation of responsibilities, 
and greater flexibility in developing, deploying, and maintaining independent modules.

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/68a6f3d1-7c51-410c-ac93-ceea655ead8e" width="300" alt="Distributed Architecture" />
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/5c9fdee7-4b98-471b-8818-3644a00ff7e9" width="313" alt="Distributed Architecture" />
    </td>
  </tr>
  <tr>
    <td align="center"><b>Distributed Architecture</b></td>
    <td align="center"><b>Centralized Architecture</b></td>
  </tr>
</table>

_________________________

**How to Use - AI-Mission-Generator and run backend**
_________________________

1. Go to the **Hugging Face** website and create a token  
  *(Fine-grained, no specific permissions required)* . Create an `.env` file and set the following variables:

```env
HUGGINGFACE_HUB_TOKEN=your_huggingface_token_here
DATABASE_URL=mysql+pymysql://username:password@localhost:3306/your_database_name
MODEL_PATH=absolute/path/to/your/model.gguf
APP_HOST=localhost
APP_PORT=8001
```

2. Set up a virtual environment:

```
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependecies:
```
pip install -r requirements.txt
```
4. Install the model from the AI-Mission-Generator:
```
python3 models/install_models.py
```

6. In the .env file, set the MODEL_PATH variable to the path where the model was installed (Use the absolute path, e.g. /Users/.../challenges/AI-Mission-Generator/models/model_name.gguf)

7. Start the FastAPI server:
```
cd BE
python3 main.py
```
7. Visit swagger at http://localhost:your_port/docs

# API Endpoints

## Users

### Get User

* **Method:** `GET`
* **Endpoint:** `/v1/users/{user_id}`

### Get All Users

* **Method:** `GET`
* **Endpoint:** `/v1/users/`

### Create User

* **Method:** `POST`
* **Endpoint:** `/v1/users/`

### Verify Existing User

* **Method:** `POST`
* **Endpoint:** `/v1/users/verify`

---

## Tracks

### Get Track

* **Method:** `GET`
* **Endpoint:** `/v1/tracks/{track_id}`

### Get All Tracks

* **Method:** `GET`
* **Endpoint:** `/v1/tracks/`

### Verify Existing Track

* **Method:** `POST`
* **Endpoint:** `/v1/tracks/verify`

---

## Missions

### Generate Missions

* **Method:** `POST`
* **Endpoint:** `/v1/missions/generate-missions`

_________________________

**Good to know about DB**
_________________________
Import the SQL file from the DB folder into MySQL to set up the database.
_________________________

**How to run frontend**
_________________________
```
cd FE
cd ./fankee_code_challenge_fe
npm i
npm run dev
```
---
# Good to Know about Front-end
### USE CASE DIAGRAM - tracklist card creation
When the user opens /tracklist, the client page requests both tracks (/api/tracks) and users (/api/users) from the frontend API routes.
Those routes proxy the calls to the backend (/v1/tracks/ and /v1/users/), which fetch data from the database and return tracks[] and users[] (necessary to obtain artist_name).

On the client, the app builds a Map<userId, nickname> from users[] and maps each track into a card-friendly item:

- title from track.track_title
- genre from track.genre
- artist by resolving track.artist_name (user id) to the user nickname

If any API call fails, the UI shows an error message.
If successful, the page renders a gallery of cards per mapped item, and the user can see/select tracks in the UI.


<img width="1725" height="1357" alt="image" src="https://github.com/user-attachments/assets/5b221a9d-5b16-49c5-ac93-e28c97a52d76" />


