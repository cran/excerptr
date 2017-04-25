## ---- comment = ""-------------------------------------------------------
path <- system.file("tests", "files", "some_file.R", package = "excerptr")
cat(readLines(path), sep = "\n")

## ------------------------------------------------------------------------
excerptr::excerptr(file_name = path, run_pandoc = FALSE, output_path = tempdir())

## ---- comment = ""-------------------------------------------------------
cat(readLines(file.path(tempdir(), sub("\\.R$", ".md", basename(path)))), sep = "\n")

## ------------------------------------------------------------------------
excerptr::excerptr(file_name = path, pandoc_formats= "html", output_path = tempdir())

## ---- comment = ""-------------------------------------------------------
cat(readLines(file.path(tempdir(), sub("\\.R$", ".html", basename(path)))), sep = "\n")

## ---- echo = FALSE, results = "hide"-------------------------------------
excerptr::excerptr(file_name = path, pandoc_formats= "html", 
                   output_path = file.path(rprojroot::find_root(rprojroot::is_r_package), 
                                           "inst", "tests", "files")
                   )

