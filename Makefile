build:
	rm -rf nats-server nats-server.conf
	cp ./docker/nats-server.conf ./
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
	docker build -t kubegames/nats:v2.7.3 .
	rm -rf nats-server nats-server.conf
	cp ./docker/nats-server.conf ./


