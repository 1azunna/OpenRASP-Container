FROM openjdk:11-jre-slim
LABEL maintainer "Azunna Ikonne <ikonne@gmail.com>"

# Perform package upgrades and set timezone
RUN useradd --create-home openrasp \
    && apt update \
    && apt upgrade -y \
    && apt install wget tar -y \
    && echo "Africa/Lagos" > /etc/timezone \
    && rm -f /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata


RUN wget https://github.com/baidu/openrasp/releases/download/v1.3.5/rasp-cloud.tar.gz \
    && tar -xvf rasp-cloud.tar.gz \
    && rm rasp-cloud.tar.gz \
    && mv rasp* rasp

WORKDIR /rasp
RUN mv conf/app.conf conf/app.conf.save
COPY config/app.conf /rasp/conf/app.conf

EXPOSE 8086

# Make sure container runs as a non-root user
USER openrasp