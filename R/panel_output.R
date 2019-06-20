#' Panel output
#'
#' This function inserts a panel.  Normally used for confirmattion screens
#' @param input_id Input id for the component
#' @param main_text Add the header for the panel
#' @param sub_text Add the main body of text for the panel
#' @keywords panel
#' @export
#' @examples
#' panel_output("panel1", "Application Complete", "Thank you for submitting your application.  Your reference is xvsiq")

panel_output <- function(input_id, main_text, sub_text) {
  tags$div(class="govuk-panel govuk-panel--confirmation", id = input_id,
    tags$h1(main_text, class = "govuk-panel__title"),
    tags$div(sub_text, class = "govuk-panel__body")
  )
}
