FROM ubuntu:latest

ARG ARCH=linux-x64
ARG VERSION=2.315.0
ARG DEBIAN_FRONTEND=noninteractive
ENV PORT=8080

RUN apt-get update && \
    apt-get install -y build-essential curl wget git tar gzip bzip2 zip unzip xz-utils ca-certificates software-properties-common docker.io awscli mysql-client-core-8.0 jq nodejs libssl-dev libdigest-sha-perl && \
    useradd -m docker -g docker && \
    mkdir -p /home/docker/actions-runner && \
    mkdir -p -m 755 /etc/apt/keyrings && \
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null && \
    chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt-get update && \
    apt-get install gh -y

WORKDIR /home/docker/actions-runner

RUN curl -o actions-runner-${ARCH}-${VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-${ARCH}-${VERSION}.tar.gz && \
    tar xzf ./actions-runner-${ARCH}-${VERSION}.tar.gz && \
    rm ./actions-runner-${ARCH}-${VERSION}.tar.gz && \
    chown -R docker ~docker

COPY start.sh start.sh
COPY server.js server.js
RUN chmod +x start.sh

USER docker

ENTRYPOINT ["./start.sh"]
