FROM elasticsearch:6.8.12
LABEL maintainer "Azunna Ikonne <ikonne@gmail.com>"

COPY ./elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY ./create_user.sh create_user.sh

RUN useradd --create-home elastic && usermod -aG sudo elastic
RUN chmod +x create_user.sh && chown elastic create_user.sh
RUN chown -hR elastic /usr/share/elasticsearch

EXPOSE 9200

USER elastic
