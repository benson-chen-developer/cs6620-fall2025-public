# python image
FROM python:3.11-slim

# sets the working directory to /app
WORKDIR /app

# ffmpeg is required by pydub to decode/export mp3 and ogg audio segments
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# installs dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# copies all files
COPY . .

# port 5000
EXPOSE 5000

# runs app
CMD ["python", "app.py"]
