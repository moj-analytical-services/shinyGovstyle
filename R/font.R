#' Font Function
#'
#' This function adds rge nta fonts
#' @keywords font
#' @export
#' @examples
#' font()

font <- function(){
  version <- as.character(packageVersion("shinyGovstyle")[[1]])

  htmltools::htmlDependency(
    name = "font", version = version,
    src = c(href="shinyGovstyle/css"),
    stylesheet = "font.css"
  )
}
