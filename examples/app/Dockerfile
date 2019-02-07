FROM ubuntu:18.04

ARG APIXUVERSION=vX.X.X

RUN apt update

# Dependencies
RUN apt install -y curl make cpanminus

# Apixu module
RUN cpanm https://github.com/apixu/apixu-perl/archive/$APIXUVERSION.tar.gz

WORKDIR /src

CMD export $(cat .env | xargs) && ./app.pl
