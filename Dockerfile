FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

RUN apt-get update && apt-get install -y --no-install-recommends gcc libsqlite3-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/

EXPOSE 8000

CMD ["python", "manage.py", "runserver"]
