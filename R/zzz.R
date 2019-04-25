# python 'scipy' module I want to use in my package
excerpts <- NULL

.onLoad <- function(libname, pkgname) {
  # delay load foo module (will only be loaded when accessed via $)
  excerpts <<- reticulate::import("excerpts", delay_load = TRUE)
}
