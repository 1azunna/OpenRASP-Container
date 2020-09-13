FROM openjdk:11-jre-slim
LABEL maintainer "Azunna Ikonne <ikonne@gmail.com>"

# Perform package upgrades and set timezone
RUN useradd --create-home openrasp \
    && apt update \
    && apt upgrade -y \
    && echo "Africa/Lagos" > /etc/timezone \
    && rm -f /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# Make sure app runs as a non-root user
USER openrasp

RUN wget https://github.com/baidu/openrasp/releases/download/v1.3.5/rasp-cloud.tar.gz \
    && tar -xvf rasp-cloud.tar.gz \
    && rm rasp-cloud.tar.gz \
    && cd rasp*

EXPOSE 8086
CMD ["./rasp-cloud","-d"]
