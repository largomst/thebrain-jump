FROM python:3.9
EXPOSE 1234
RUN pip install --no-cache-dir pdm
COPY . /app
WORKDIR /app
RUN pdm install
CMD ["pdm", "run", "gunicorn", "app:app", "-b", "0:1234"]
