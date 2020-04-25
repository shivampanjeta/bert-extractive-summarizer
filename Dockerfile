FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y sudo \
    build-essential \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    wget \
    python3-dev \
    python3-pip \
    libxrender-dev \
    libxext6 \
    libsm6 \
    openssl

RUN mkdir -p /opt/service
COPY requirements-service.txt /opt/service
COPY summarizer /opt/service/summarizer
COPY server.py /opt/service
WORKDIR /opt/service

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements-service.txt

ENTRYPOINT ["python3", "./server.py"]
