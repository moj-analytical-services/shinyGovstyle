#' Back Link Function
#'
#' This function adds a back link to the page
#' @param inputId The input slot that will be used to access the value.
#' @param link Link for when the button is clicked  Defaults to #
#' @return a backlink html shiny object
#' @keywords backlink
#' @export
#' @examples
#' backlink_Input("backid")

backlink_Input <- function(inputId, link = "#") {
  govBacklink <- shiny::tags$a("Back", href=link, class="govuk-back-link")
  attachDependency(govBacklink)
}
