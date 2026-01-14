FROM python:3.13.11-slim
LABEL authors="devshreegavande"
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/
WORKDIR /app
COPY "pyproject.toml" "uv.lock" ".python-version" ./
ENV PATH="/app/.venv/bin:$PATH"
RUN uv sync --locked
COPY ingest_data.py ingest_data.py
ENTRYPOINT ["python", "ingest_data.py"]