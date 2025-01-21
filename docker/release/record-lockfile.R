#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
tmp <- tempfile()
pkg <- args[1]
out <- if (is.na(args[2])) stdout() else args[2]
ver <- packageVersion(pkg)
dir.create(tmp)
owd <- setwd(tmp)
on.exit(setwd(owd), add = TRUE)
writeLines(sprintf("library(%s)", pkg), "tmp.R")
renvtmp <- tempfile()
sink(renvtmp)
renv::init()
renv::record(sprintf("%s@%s", pkg, ver))
renv::restore(prompt = FALSE)
renv::snapshot()
sink()
writeLines(readLines(file.path(tmp, "renv.lock")), out)
