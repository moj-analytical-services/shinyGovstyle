#' Load Style Function
#'
#' This function loads the css needed for gov style documents
#' @keywords style
#' @export
#' @examples
#' load_style()

load_style <- function(){

  shiny::addResourcePath('shinyGovstyle', system.file('www', package = 'shinyGovstyle'))
  version <- as.character(packageVersion("shinyGovstyle")[[1]])

  htmltools::htmlDependency(
    name = "stylecss",
    version = version,
    src = c(href="shinyGovstyle"),
    script = "js/radio_button_input_binding.js",
    stylesheet = "css/govuk-frontend-norem.css"
  )
}
