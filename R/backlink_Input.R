#' Back Link Function
#'
#' This function adds a back link to the page
#' @param inputId The input slot that will be used to access the value.
#' @param link Link for when the button is clicked  Defaults to #
#' @keywords backlink
#' @export
#' @examples
#' back_link("backid")

backlink_Input <- function(inputId, link = "#") {
  govBacklink <- tags$a("Back", href=link, class="govuk-back-link")
  attachDependency(govBacklink)
}
