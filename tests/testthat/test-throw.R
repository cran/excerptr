testthat::context("Testing excerptr:::throw()")
testthat::test_that("throw the excerptr exception", {
                        error_message <- "hello, testthat"
                        string <- "hello, testthat"
                        testthat::expect_error(excerptr:::throw(string),
                            error_message)
}
)
