#' Insert Text Function
#'
#' This function loads the insert text component
#' @keywords insert text
#' @param text text that yuu want to display
#' @export
#' @examples
#' insert_text("It can take up to 8 weeks to register a lasting power of attorney if there are no mistakes in the application.")

insert_text <- function(text) {
  tags$div(text, class="govuk-inset-text")
}
