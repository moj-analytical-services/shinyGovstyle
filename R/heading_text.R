#' Heading Text Function
#'
#' This function create a heading text
#' @param text_input Text to display
#' @param size Text size using xl, l, m, s.  Defaults to xl.
#' @keywords heading
#' @export
#' @examples
#' heading_text("This is great text", "m")

heading_text <- function(text_input, size = "xl"){
  tags$h1(text_input, class=paste0("govuk-heading-", size))
}
