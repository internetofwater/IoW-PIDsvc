FROM rocker/r-ver:3.6.3

LABEL maintainer="David Blodgett <dblodgett@usgs.gov>"

USER root

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  && install2.r --error \
    --deps TRUE xml2

ADD ./pidsvcBackup /pidsvcBackup

RUN Rscript -e 'install.packages("/pidsvcBackup/", repos = NULL, type = "source")'