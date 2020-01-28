FROM pistacks/alpine:3.11.3 as builder

ENV NODE_ID=none
WORKDIR /tmp

RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-armv7.tar.gz

RUN tar -xf node_exporter-0.18.1.linux-armv7.tar.gz && cd node_exporter-0.18.1.linux-armv7  \
    && mv node_exporter /bin/node_exporter

FROM busybox

COPY conf /etc/node-exporter/
COPY --from=builder /bin/node_exporter /bin/node_exporter

RUN chmod +x /etc/node-exporter/docker-entrypoint.sh

EXPOSE     9100
ENTRYPOINT  [ "/etc/node-exporter/docker-entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]
