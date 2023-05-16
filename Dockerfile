FROM arm64v8/debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    tar \
    gnupg2 \
    software-properties-common \
    wget \
    jq \
    unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
  && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    postgresql-client \
    redis-tools \
    lynis \
    python3-pip \
    kubectl \
  && pip3 install --upgrade pip \
  && pip3 install awscli --upgrade \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN curl -LJO https://github.com/casey/just/releases/download/1.13.0/just-1.13.0-aarch64-unknown-linux-musl.tar.gz \
    && tar -xzf just-1.13.0-aarch64-unknown-linux-musl.tar.gz \
    && mv just /usr/local/bin/ \
    && rm just-1.13.0-aarch64-unknown-linux-musl.tar.gz

CMD ["bash"]
