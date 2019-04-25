test_exception <- function() {
    RUnit::checkException(excerptr:::throw("Hello, error!"))
}
