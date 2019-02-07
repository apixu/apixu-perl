FROM perl:slim

ARG APIXUVERSION=vX.X.X

RUN apt update && \
    apt install -y curl gcc && \
    cpanm https://github.com/apixu/apixu-perl/archive/$APIXUVERSION.tar.gz && \
    curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious

CMD export $(cat .env | xargs) && morbo app.pl
