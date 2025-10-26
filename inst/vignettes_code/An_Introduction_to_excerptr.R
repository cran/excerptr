# adapted from reticulate vignettes/python_packages.Rmd

if (!reticulate::py_available(initialize = TRUE)) {
    knitr::opts_chunk$set(eval = FALSE)
} else {
    inst <- tryCatch(reticulate::py_install("excerpts"), error = identity)
    if (inherits(inst, "error")) {
        knitr::opts_chunk$set(eval = FALSE)
    } else {
        knitr::opts_chunk$set(eval = TRUE)
    }
}

path <- system.file("tests", "files", "some_file.R", package = "excerptr")
cat(readLines(path), sep = "\n")

excerptr::excerptr(file_name = path, run_pandoc = FALSE, output_path = tempdir())

cat(readLines(file.path(tempdir(), sub("\\.R$", ".md", basename(path)))), 
    sep = "\n")

is_pandoc_installed <- nchar(Sys.which("pandoc")) > 0 &&
                              nchar(Sys.which("pandoc-citeproc")) > 0
is_pandoc_version_sufficient <- FALSE
if (is_pandoc_installed) {
    reference <- "1.12.3"
    version <- strsplit(system2(Sys.which("pandoc"), "--version", stdout = TRUE), 
                        split = " ")[[1]][2]
    if (utils::compareVersion(version, reference) >= 0)
        is_pandoc_version_sufficient <- TRUE
}
if (is_pandoc_version_sufficient) 
    excerptr::excerptr(file_name = path, pandoc_formats = "html", 
                       output_path = tempdir())

if (is_pandoc_version_sufficient) 
    cat(readLines(file.path(tempdir(), sub("\\.R$", ".html", basename(path)))), 
        sep = "\n")
if (is_pandoc_version_sufficient) 
    excerptr::excerptr(file_name = path, pandoc_formats = "html", 
                       output_path = file.path(rprojroot::find_root(rprojroot::is_r_package), 
                                               "inst", "tests", "files")
                       )

# browseURL(file.path(tempdir(), sub("\\.R$", ".html", basename(path))))
# 
