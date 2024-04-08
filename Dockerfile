FROM ubuntu:latest

ARG TOKEN
ARG URL
ARG VERSION="2.315.0"
ARG VERSION_CHECKSUM="6362646b67613c6981db76f4d25e68e463a9af2cc8d16e31bfeabe39153606a0"
ARG DEBIAN_FRONTEND=noninteractive
ENV PORT=8080

RUN apt-get update && \
    apt-get install -y curl build-essential libssl-dev libdigest-sha-perl tar jq nodejs && \
    useradd -m docker && \
    mkdir -p /home/docker/actions-runner

WORKDIR /home/docker/actions-runner

RUN curl -o actions-runner-linux-x64-${VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz && \
    echo "${VERSION_CHECKSUM}  actions-runner-linux-x64-${VERSION}.tar.gz" | shasum -a 256 -c && \
    tar xzf ./actions-runner-linux-x64-${VERSION}.tar.gz && \
    rm ./actions-runner-linux-x64-${VERSION}.tar.gz && \
    chown -R docker ~docker

COPY start.sh start.sh
RUN chmod +x start.sh

USER docker

ENTRYPOINT ["./start.sh"]
