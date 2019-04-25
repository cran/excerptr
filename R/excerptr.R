#' Excerpt Structuring Comments and Set a Table of Contents.
#'
#' Just a wrapper to the python function \command{excerpts.excerpts}.
#' See \url{https://pypi.org/project/excerpts/} for details.
#'
#' @param file_name Name the file from which to excerpt.
#' @param comment_character Should be "#" for R.
#' @param magic_character The magic character marking the structuring comments
#' in \code{file_name}.
#' @param output_path Name the path where to output to.
#' @param allow_pep8 Don't bother. See \command{excerpts.excerpts} for details.
#' @param prefix Give a prefix to use for output files.
#' @param postfix Give a postfix to use for output files.
#' @param run_pandoc Try to run \command{pandoc} on the output?
#' @param compile_latex Try to compile LaTeX if \command{pandoc} has output
#' LaTeX?
#' @param pandoc_formats A character vector naming the output formats for
#' \command{pandoc}.
#' @return The status of \command{excerpts.excerpts}.
#' @export
#' @examples
#' root <- system.file(package = "excerptr")
#' test_files <- file.path(root, "excerpts", "tests", "files")
#' if (reticulate::py_available(initialize = TRUE))
#'     tryCatch(
#'              excerptr(file_name = file.path(test_files, "some_file.txt"),
#'                       output_path = tempdir(), run_pandoc = FALSE,
#'                       compile_latex = FALSE,
#'                       pandoc_formats = c("tex", "html")),
#'              error = identity)
excerptr <- function(file_name, comment_character = "#", magic_character = "%",
             output_path = "", allow_pep8 = TRUE,
             prefix = "", postfix = "", run_pandoc = TRUE,
             compile_latex = FALSE, pandoc_formats = "tex") {
    checkmate::qassert(file_name, "S1")
    checkmate::qassert(comment_character, "S1")
    checkmate::qassert(magic_character, "S1")
    checkmate::qassert(output_path, "S1")
    checkmate::qassert(allow_pep8, "B1")
    checkmate::qassert(prefix, "S1")
    checkmate::qassert(postfix, "S1")
    checkmate::qassert(run_pandoc, "B1")
    checkmate::qassert(compile_latex, "B1")
    checkmate::qassert(pandoc_formats, "S+")
    if (!reticulate::py_module_available("excerpts"))
        reticulate::py_install("excerpts")
    excerpts <- reticulate::import("excerpts")
    status <- excerpts[["excerpts"]](file_name = file_name,
                                        comment_character = comment_character,
                                        magic_character = magic_character,
                                        output_path = output_path,
                                        allow_pep8 = allow_pep8,
                                        prefix = prefix, postfix = postfix,
                                        run_pandoc = run_pandoc,
                                        compile_latex = compile_latex,
                                        pandoc_formats =
                                            as.list(pandoc_formats))
    return(status)
}
