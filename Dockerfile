FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1 \
    PORT=7860

WORKDIR /app

# System packages needed by AutoGluon and plotting backends
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libgomp1 libgl1 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 7860

CMD ["python", "app.py"]
