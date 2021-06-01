# Project overview

The `graphql-grpc` project is designed to orchestrate(clone, build and start) 
the `graphql` and `grpc` services(see more about them here: [graphql](https://github.com/ebalkanski/graphql),
[grpc](https://github.com/ebalkanski/grpc)).

## Prerequisites

* Install `git`
* [Install Go](https://golang.org/doc/install) and set the
  [`$GOPATH` environment variable](https://github.com/golang/go/wiki/SettingGOPATH)
* Install `docker` and `docker-compose`
* Clone the `graphql-grpc` repo

The repo must be cloned in the `$GOPATH/src/github.com/ebalkanski` directory.
You must create it if it doesn't exist.

```bash
mkdir -p $GOPATH/src/github.com/ebalkanski
cd $GOPATH/src/github.com/ebalkanski
git clone https://github.com/ebalkanski/graphql-grpc.git
cd graphql-grpc
```

## Fetch all services involved in the project
```bash
./scripts/setup.sh
```

## Start all services with Docker Compose
```bash
docker-compose up -d
```

This command will start two Docker containers:
- the `graphql` service container listening
  for requests on port 8080 and accessible via browser on `http://localhost:8080`
- the `grpc` grpc service container listening for requests on port 8081

You can see the logs of the running containers by executing:
```bash
docker logs -f graphql
docker logs -f grpc
```

Test it by opening [http://localhost:8080](http://localhost:8080) in a browser.