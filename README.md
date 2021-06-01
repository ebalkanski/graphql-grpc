# Project overview

The `crypto-workspace` project is designed to orchestrate(clone, build and start) 
the `cryptofeed` and `cryptocache` services(see more about them here: [cryptofeed](https://bitbucket.scalefocus.com/projects/GO/repos/cryptofeed/browse),
[cryptocache](https://bitbucket.scalefocus.com/projects/GO/repos/cryptocache/browse)).

## Prerequisites

* Install `git`
* [Install Go](https://golang.org/doc/install) and set the
  [`$GOPATH` environment variable](https://github.com/golang/go/wiki/SettingGOPATH)
* Install `docker` and `docker-compose`
* Clone the `crypto-workspace` repo

The repo must be cloned in the `$GOPATH/src/bitbucket.scalefocus.com/go` directory.
You must create it if it doesn't exist.

```bash
mkdir -p $GOPATH/src/bitbucket.scalefocus.com/go
cd $GOPATH/src/bitbucket.scalefocus.com/go
git clone ssh://git@bitbucket.scalefocus.com:7999/go/crypto-workspace.git
cd crypto-workspace
```

## Fetch all services involved in the project
```bash
./scripts/setup.sh
```

## Start all services with Docker Compose
```bash
docker-compose up -d
```

This command will start three Docker containers:
- the `cryptofeed` service container listening
  for requests on port 8080 and accessible via browser on `http://localhost:8080`
- the `cryptocache` grpc service container listening for requests on port 8081
- a MySQL database container 

You can see the logs of the running containers by executing:
```bash
docker logs -f cryptofeed
docker logs -f cryptocache
docker logs -f mysqldb
```

Test it by opening [http://localhost:8080](http://localhost:8080) in a browser.