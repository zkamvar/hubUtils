FROM rocker/r-ver:4

LABEL org.opencontainers.image.description="hubUtils development version"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="Zhian N. Kamvar <zkamvar@umass.edu>"

# install general OS utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    git

# install OS binaries required by R packages - via rocker-versioned2/scripts/install_tidyverse.sh
RUN apt-get install -y --no-install-recommends \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /project

# install required R packages using renv
RUN install2.r --skipinstalled --error \
  --repo https://hubverse-org.r-universe.dev/ \
  --repo getOption \
  hubUtils \
  renv \
  && strip /usr/local/lib/R/site-library/*/libs/*.so \
  && rm -rf /tmp/downloaded_packages

COPY record-lockfile.R /usr/local/bin/record-lockfile.R
RUN chmod u+x /usr/local/bin/record-lockfile.R
