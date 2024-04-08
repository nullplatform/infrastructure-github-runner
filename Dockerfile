FROM ubuntu:latest
ARG TOKEN
ARG URL
ARG VERSION="2.315.0"
ARG VERSION_CHECKSUM="6362646b67613c6981db76f4d25e68e463a9af2cc8d16e31bfeabe39153606a0"
# prevents installdependencies.sh from prompting the user and blocking the image creation
ARG DEBIAN_FRONTEND=noninteractive
ENV PORT=8080

RUN apt-get update && apt-get install -y curl libdigest-sha-perl tar jq nodejs
RUN useradd -m docker
RUN cd /home/docker && mkdir actions-runner && cd actions-runner
RUN curl -o actions-runner-linux-x64-${VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz
RUN echo "${VERSION_CHECKSUM}  actions-runner-linux-x64-${VERSION}.tar.gz" | shasum -a 256 -c
RUN tar xzf ./actions-runner-linux-x64-${VERSION}.tar.gz
RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh
COPY start.sh start.sh
RUN chmod +x start.sh
# since the config and run script for actions are not allowed to be run by root 
# use "docker" user so all subsequent commands are run as this user
USER docker

RUN ./start.sh