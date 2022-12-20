FROM python:3.7-slim AS compile-image
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /app
COPY requirements .
RUN pip install -r requirements

FROM python:3.7-slim AS build-image
RUN apt-get update && apt-get install -y \
  netcat \
  vim \
  curl \
  && rm -rf /var/lib/apt/lists/*
COPY --from=compile-image /opt/venv /opt/venv
WORKDIR /app

ENV PATH="/opt/venv/bin:$PATH"
ENV DBT_PROFILES_DIR /app
ENTRYPOINT ["tail", "-f", "/dev/null"]
