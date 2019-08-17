#' Font Function
#'
#' This function adds rge nta fonts
#' @keywords font
#' @export
#' @examples
#' font()

font <- function(){
  htmltools::htmlDependency(
    name = "font", version = version,
    src = c(href="shinyGovstyle/css"),
    stylesheet = "font.css"
  )
}
