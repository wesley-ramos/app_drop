FROM mysql:5.6

RUN mkdir -p /app/config && mkdir -p /app/error  

COPY docker-entrypoint.sh /app/docker-entrypoint.sh

RUN chmod -R 777 /app

WORKDIR /app

VOLUME /app/config
VOLUME /app/error

CMD ["/app/docker-entrypoint.sh"]