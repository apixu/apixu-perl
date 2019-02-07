FROM perl:slim

RUN apt update && \
    apt install -y curl gcc libjson-perl libwww-perl
