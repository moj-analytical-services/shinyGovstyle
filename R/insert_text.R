#' Insert Text Function
#'
#' This function loads the insert text component to display additional information in a special format.
#' @param inputId The input slot that will be used to access the value.
#' @param text Text that yuu want to display on the insert
#' @keywords inserttext
#' @export
#' @examples
#' insert_text("note", "It can take up to 8 weeks to register a lasting power of attorney if there are no mistakes in the application.")

insert_text <- function(inputId, text) {
  govInsert <- tags$div(text, id = inputId, class="govuk-inset-text")
  attachDependency(govInsert)
}
