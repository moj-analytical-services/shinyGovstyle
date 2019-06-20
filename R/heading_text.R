#' Header Function
#'
#' This function create a header banner
#' @param text_input Text to display
#' @param main_link Text size using xl, l, m, s.  Defaults to xl.

#' @keywords heading
#' @export
#' @examples
#' heading_text()

heading_text <- function(text_input, size = "xl"){
  tags$h1(text_input, class=paste0("govuk-heading-", size))
}
