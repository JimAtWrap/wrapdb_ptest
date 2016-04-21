# Dockerfile
FROM postgres:9.4

RUN mkdir -p /tmp/setup
COPY ./db/wrapdb.gz /tmp/setup
COPY ./scripts/setup.sh /tmp/setup
RUN mkdir -p /tmp/scripts
COPY ./scripts/startup.sh /tmp/scripts
WORKDIR /tmp

EXPOSE 5432

RUN /tmp/setup/setup.sh
RUN rm -rf /tmp/setup

CMD /tmp/scripts/startup.sh

