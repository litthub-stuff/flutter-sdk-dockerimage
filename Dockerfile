FROM google/cloud-sdk:latest
#FROM debian:latest

ENV HOME "/home/litthub/"
ENV FLUTTER_SDK_HOME ".flutter-sdk"
ENV FLUTTER_HOME "${HOME}${FLUTTER_SDK_HOME}"
ENV PATH $PATH:$FLUTTER_HOME/bin

# Clone and extract Flutter SDK
RUN mkdir $HOME \
    && cd $HOME \
    && apt-get update \
    && apt-get -y install git \
    && apt-get -y install curl \
    && apt-get -y install unzip \
    && git clone https://github.com/flutter/flutter.git -b stable \
    && mv flutter $FLUTTER_SDK_HOME

RUN flutter precache
