# pipelinedb 1.0 docker image


## How to Run

* build

```code
docker-compose build
```

* run

```code
docker-compose up -d
```

## How to use

* local build

```code
docker build -t mypipelinedb .
```

* run

```code
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=dalongdemo
dalongrong/pipelinedb:1.0
```