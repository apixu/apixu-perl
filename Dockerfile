FROM perl:slim

RUN apt update && \
    apt install -y libjson-perl libwww-perl
