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
  && rm -rf /var/lib/apt/lists/*
COPY --from=compile-image /opt/venv /opt/venv

ARG USER_ID
ARG GROUP_ID

#COPY . /app
WORKDIR /app
#USER nobody

EXPOSE 8080
EXPOSE 36829
ENV PATH="/opt/venv/bin:$PATH"
ENV JUPYTER_TOKEN access
RUN addgroup --gid $GROUP_ID dev
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID dev
USER dev
#CMD ["mlflow", "server", "-h", "0.0.0.0", "-p", "5000", "--backend-store-uri", "postgresql://mlflow_admin:mlflow_password_22@db:5432/mlflow", "--default-artifact-root", "s3://mlflowartifactstoredlbd"] 
CMD ["jupyter", "lab", "--port", "8080", "--allow-root", "--no-browser", "--ip", "*"]
