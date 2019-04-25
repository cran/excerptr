library(testthat)
if (interactive()) {
    devtools::load_all()
} else {
    library("excerptr")
}
skip_if_no_python <- function() {
    if (!reticulate::py_available(initialize = TRUE))
        skip("Python bindings not available for testing")
}

skip_if_no_excerpts <- function() {
    have_excerpts <- reticulate::py_module_available("excerpts")
    if (!have_excerpts)
        skip("excerpts not available for testing")
}

context("Markdown")
test_that("md", {
              skip_if_no_python()
              skip_if_no_excerpts()
              out_file <- file.path(tempdir(), "some_file.out")
              excerptr(file = system.file("tests", "files", "some_file.R",
                                          package = "excerptr"),
                       output_path = out_file,
                       run_pandoc = FALSE)
              result <- readLines(out_file)
              expectation <- readLines(system.file("tests", "files",
                                                   "some_file.md",
                                                   package = "excerptr"))
              expect_equal(result, expectation)
})

context("pandoc")
is_pandoc_installed <- nchar(Sys.which("pandoc")) > 0
if (is_pandoc_installed) {
    test_that("pandoc_formats", {
                  skip_if_no_python()
                  skip_if_no_excerpts()
                  out_file <- file.path(tempdir(), "some_file.md")
                  excerptr(file = system.file("tests", "files", "some_file.R",
                                              package = "excerptr"),
                           pandoc_formats = c("tex", "html"),
                           output_path = tempdir(),
                           run_pandoc = TRUE)
                  result <- readLines(out_file)
                  expectation <- readLines(system.file("tests", "files",
                                                       "some_file.md",
                                                       package = "excerptr"))
                  expect_equal(result, expectation)
})
}
