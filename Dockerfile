FROM python:3.9-alpine

EXPOSE 1234

WORKDIR /app

RUN pip install --no-cache-dir pdm
COPY pyproject.toml pdm.lock .pdm.toml /app
RUN pdm install

COPY app.py /app

CMD ["pdm", "run", "gunicorn", "app:app", "-b", "0:1234"]
