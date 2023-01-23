FROM python:3.9

COPY requirements.txt .
RUN python -m pip install --no-cache -r requirements.txt

COPY . /nightimaging
WORKDIR /nightimaging