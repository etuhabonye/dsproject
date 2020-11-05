#' Use
#'
#' This function asks the user if they want to download a package and if so  will download it.
#'
#' @param pkg a package
#'
#' @return Will return either a loaded package or will not load a package based on user input.
#' @examples
#' # use(my_package)
use <- function(pkg) {
  pkg <- as.character(substitute(pkg))
  if (!suppressWarnings(require(pkg, character.only = TRUE))) {
    msg <- paste("Install package", pkg, "(y/n)? ")
    answer <- readline(msg)
    answer <- substr(tolower(trimws(answer)), 1, 1)
    if (answer == "y") {
      install.packages(pkg)
      require(pkg, character.only = TRUE)
    } else {
      msg <- paste("Package", pkg, "not loaded.")
      message(msg)
    }
  }
}
