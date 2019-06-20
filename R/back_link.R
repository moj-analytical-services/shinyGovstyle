#' Back Link Function
#'
#' This function adds a back link
#' @keywords Back link
#' @param link Link for when the button is clicked  Defaults to #
#' @export
#' @examples
#' back_link()

back_link <- function(link = "#") {
  tags$a("Back", href=link, class="govuk-back-link")
}
