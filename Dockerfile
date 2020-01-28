FROM pistacks/alpine:3.11.3 as builder

WORKDIR /tmp

RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-armv7.tar.gz

RUN tar -xf node_exporter-0.18.1.linux-armv7.tar.gz && cd node_exporter-0.18.1.linux-armv7  \
    && mv node_exporter /bin/node_exporter

FROM busybox

COPY --from=builder /bin/node_exporter /bin/node_exporter

RUN  adduser -H -s /bin/false -D node_exporter && \
    chown node_exporter:node_exporter /bin/node_exporter

EXPOSE     9100
USER       node_exporter
CMD        [ "/bin/node_exporter"]
