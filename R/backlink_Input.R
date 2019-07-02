#' Back Link Function
#'
#' This function adds a back link to the page
#' @inputId The input slot that will be used to access the value.
#' @param link Link for when the button is clicked  Defaults to #
#' @keywords back link
#' @export
#' @examples
#' back_link("backid")

backlink_Input <- function(inputId, link = "#") {
  tags$a("Back", href=link, class="govuk-back-link")
}