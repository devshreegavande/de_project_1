FROM python:3.13.11-slim
LABEL authors="devshreegavande"
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/
WORKDIR /app
COPY "pyproject.toml" "uv.lock" ".python-version" ./
ENV PATH="/app/.venv/bin:$PATH"
RUN uv sync --locked
COPY pipeline.py pipeline.py
ENTRYPOINT ["python", "pipeline.py"]