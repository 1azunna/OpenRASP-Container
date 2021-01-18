FROM openjdk:11-jre-slim
LABEL maintainer "Azunna Ikonne <ikonnea@gmail.com>" 

# Perform package upgrades and set timezone
# hadolint ignore=DL3008
RUN useradd --create-home openrasp \
    && apt-get update \
    && apt-get install --no-install-recommends wget tar curl -y \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Africa/Lagos" > /etc/timezone \
    && rm -rf /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# hadolint ignore=DL3020
ADD "https://github.com/1azunna/openrasp-english/releases/download/v1.3.5/rasp-cloud.tar.gz" .

RUN tar -xvf rasp-cloud.tar.gz \
    && rm rasp-cloud.tar.gz \
    && mv rasp* /rasp

WORKDIR /rasp
RUN mv conf/app.conf conf/app.conf.save
COPY start.sh start.sh    
COPY rasp-cloud.sh /etc/init.d/rasp-cloud.sh
RUN chmod +x start.sh /etc/init.d/rasp-cloud.sh && chown -hR openrasp /rasp

EXPOSE 8086

# Make sure container runs as a non-root user
USER openrasp

HEALTHCHECK  --interval=30s --timeout=5s \
    CMD curl --fail http://localhost:8086/ || exit 1 