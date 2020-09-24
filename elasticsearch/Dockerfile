FROM elasticsearch:6.8.12
LABEL maintainer "Azunna Ikonne <ikonne@gmail.com>"

COPY ./elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY ./create_user.sh create_user.sh

RUN chmod +x create_user.sh

CMD ["./create_user.sh"]