FROM arm64v8/debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
  && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    postgresql-client \
    redis-tools \
    curl \
    lynis \
    jq \
    unzip \
    python3-pip \
    gnupg2 \
    kubectl \
 && pip3 install --upgrade pip \
 && pip3 install awscli --upgrade \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
