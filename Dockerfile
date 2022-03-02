FROM alpine:latest


ADD Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

RUN apk add --update ca-certificates && mkdir -p /nats/bin && mkdir /nats/conf

COPY nats-server.conf /nats/conf/nats-server.conf
COPY nats-server /bin/nats-server

EXPOSE 4222 8222 6222 5222

ENTRYPOINT ["/bin/nats-server"]
CMD ["-c", "/nats/conf/nats-server.conf"]
