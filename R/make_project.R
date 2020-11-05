#' Make Project
#'
#' This function creates a package which makes path directories, a READ.me file and creates
#' the RStudio Project
#'
#' @param project The name of the project
#' @param path this is the path where the user wants the project to be located. The default will be the current working directory
#' @param folders the names of the folders the files from the project will go in. The default are "figures", "documentation","data", "reports", "R"
#' @param readme the file where the description of the file will go. The default is "README.md"
#' @param git is defaulted at FALSE
#'
#' @return RETURN_DESCRIPTION
#' @examples
#' # myproject <- make_project(newproject)
make_project <- function (project,
                  path = getwd(),
                  folders = c("figures", "documentation",
                              "data", "reports", "R"),
                  readme = "README.md",
                  git = FALSE) {


  # change to path location
  if(!dir.exists(path)) stop("No such path")
  setwd(path)

  # project directory
  if(!missing(project)) {
    dir.create(project)
    setwd(project)
  }

  # create subdirectories
  for (i in folders){
    dir.create(i)
  }


  # create README.md
  today <- Sys.Date()
  user  <- Sys.info()[["user"]]
  project <- basename(getwd())
  cat("# Project: ", project, "\n\n",
      "## Author: ", user, "\n\n",
      "## Date: ",   format(today, format="%B %d %Y"), "\n\n",
      "## Purpose: \n\n",
      "## Data Sources: \n\n",
      "## Stakeholders: \n\n",
      file = readme,
      sep = "")

  # create RStudio project
  usethis::create_project(".", open=FALSE)

  # add git
  if (git){
     usethis::use_git()
  }


  # activate project
  usethis::proj_activate(".")

}
