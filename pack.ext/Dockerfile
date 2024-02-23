FROM python:3.11.0-uv

WORKDIR /app/requirements

COPY misc/pyproject_to_requirements.py ptr.py

COPY pack.core/pyproject.toml core.toml
RUN python3.11 ptr.py core.toml > core.txt
RUN uv pip install -r core.txt --no-cache

COPY pack.ext/pyproject.toml ext.toml
RUN python3.11 ptr.py ext.toml --ignore pack.core > ext.txt
RUN uv pip install -r ext.txt --no-cache

WORKDIR /app

COPY pack.core/pack pack
COPY pack.ext/pack pack

ENV PYTHONPATH "${PYTHONPATH}:/app/pack"
ENTRYPOINT [ "python", "pack/ext/main.py" ]
