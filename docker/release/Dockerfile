FROM rocker/r-ver:4.4.2

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
RUN Rscript -e 'install.packages(c("hubUtils", "renv"), repos = c("https://hubverse-org.r-universe.dev/bin/linux/noble/4.4/", "https://packagemanager.posit.co/cran/__linux__/noble/latest"))'
RUN Rscript -e 'tmp <- tempfile(); \
dir.create(tmp); \
owd <- setwd(tmp); \
writeLines("library(hubUtils)", "tmp.R"); \
renv::init(); \
renv::record("hubUtils"); \
renv::restore(prompt = FALSE); \
renv::snapshot(); \
print(owd); \
file.copy("renv.lock", "/etc/", overwrite = TRUE)'
