FROM python:3.9

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev \
    libopencv-dev ffmpeg \
    libgl1-mesa-glx

COPY requirements.txt .
RUN python -m pip install --no-cache -r requirements.txt

COPY . /nightimaging
WORKDIR /nightimaging