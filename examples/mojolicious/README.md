# APP

## Mojolicious app using Apixu

### Requirements
* Docker

### Setup app

Set APIXUKEY in the .env file.
```
cp .env.dist .env
```

Set Apixu module version (APIXUVERSION) in [Dockerfile](./Dockerfile).

Build image
```
make build
```

### Run app
```
make run
```

### Test
```
curl 127.0.0.1:3000/weather/search?q=London
```
