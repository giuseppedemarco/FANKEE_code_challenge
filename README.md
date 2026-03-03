**Good To Know**
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

**How to Use - AI-Mission-Generator**
_________________________

1. Edit the `.env` file 

- Go to the **Hugging Face** website and create a token  
  *(Fine-grained, no specific permissions required)*
- Create an `.env` file and set the following variables:

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
Install dependencies: pip install -r requirements.txt
```
4. Install the model from the AI-Mission-Generator:
```
python3 models/install_models.py
```

6. In the .env file, set the MODEL_PATH variable to the path where the model was installed (Use the absolute path, e.g. /Users/.../challenges/AI-Mission-Generator/models/model_name.gguf)

7. Start the FastAPI server:
```
cd backend
python3 main.py
```
7. Visit swagger at http://localhost:8001/docs#/

```

