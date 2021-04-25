FROM ubuntu:20.04
LABEL name="Hawking-node"
LABEL maintainer="https://github.com/hawkingnetwork"

ENV TZONE=Asia/Ho_Chi_Minh
ENV LANG=C.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZONE /etc/localtime && echo $TZONE > /etc/timezone

# Install build dependencies
RUN apt-get update -y \
    && apt-get install -y automake \
    build-essential \
    apt-utils \
    curl \
    && apt-get clean

RUN mkdir -p /root/setup
WORKDIR /root/setup
RUN curl https://getsubstrate.io -sSf | bash -s -- --fast
ENV PATH=/root/.cargo/bin:$PATH
RUN cargo --version
RUN rustup update nightly & \
    rustup update stable &\
    rustup target add wasm32-unknown-unknown --toolchain nightly

RUN git clone -b v3.0.0 --depth 1 https://github.com/substrate-developer-hub/substrate-node-template /substrate-node
WORKDIR /substrate-node
RUN git checkout -b my-first-substrate-chain 
RUN cargo clean
RUN cargo build --release

WORKDIR /substrate-node/target/release
# Expose ports
EXPOSE 9944