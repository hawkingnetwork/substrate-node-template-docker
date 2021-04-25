FROM ubuntu:20.04
LABEL name="Hawking-front-end"
LABEL maintainer="https://github.com/hawkingnetwork"

ENV DEBIAN_FRONTEND=nonintercative
ENV TZONE=Asia/Ho_Chi_Minh
ENV LANG=C.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZONE /etc/localtime && echo $TZONE > /etc/timezone

ARG NODEJS_MAJOR_VERSION=12

RUN apt-get update && apt-get install curl -y &&\
  curl --proto '=https' --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_${NODEJS_MAJOR_VERSION}.x | bash - &&\
  apt-get install nodejs git -y

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
  apt-get update && apt-get install gcc g++ make gnupg2 yarn -y

RUN git clone -b v3.0.0 --depth 1 https://github.com/substrate-developer-hub/substrate-front-end-template substrate
WORKDIR /substrate
RUN yarn install

COPY ./start.sh /substrate/start.sh
RUN chmod 540 /substrate/start.sh
RUN apt-get update -y \
    && apt-get install -y telnet nano \
    && apt-get clean
# Image clean-up
RUN apt-get autoremove -y
RUN apt-get clean
RUN apt-get autoclean


# Creating non root user substrate
RUN useradd -m substrate

# Change permission
RUN chown -R substrate:substrate /substrate
RUN chmod g+s /substrate

# Switch user
USER substrate:substrate
WORKDIR /substrate


