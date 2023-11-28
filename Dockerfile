FROM library/alpine:latest

ARG JACOCO_VERSION=0.8.11

RUN apk add -U --no-cache unzip && \
    wget -q https://github.com/jacoco/jacoco/releases/download/v${JACOCO_VERSION}/jacoco-${JACOCO_VERSION}.zip -O jacoco.zip && \
    mkdir /jacoco && \
    unzip jacoco.zip -d /jacoco && \
    rm jacoco.zip

VOLUME "/jacoco"

CMD /bin/sh -c "trap ':' TERM INT; sleep 3600 & wait"
