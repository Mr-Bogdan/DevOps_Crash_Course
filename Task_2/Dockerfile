FROM ubuntu:18.04 as ubuntu
WORKDIR /app
RUN apt-get update -y && apt-get install -y wget
RUN wget https://github.com/mplesha/NoviNano/releases/download/v1.0/20180706_novinano_nk_71b6e5d0e46a01132850180706065954_installer.php && \
    wget https://github.com/mplesha/NoviNano/releases/download/v1.0/20180706_novinano_nk_71b6e5d0e46a01132850180706065954_archive.zip
RUN mv *_installer.php installer.php

FROM wordpress
WORKDIR /var/www/html
RUN rm -rf /var/www/html/*
COPY --from=ubuntu /app /var/www/html
EXPOSE 8080
