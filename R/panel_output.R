#' Panel output
#'
#' This function inserts a panel.  Normally used for confirmattion screens
#' @param inputId The input slot that will be used to access the value.
#' @param main_text Add the header for the panel
#' @param sub_text Add the main body of text for the panel
#' @keywords panel
#' @export
#' @examples
#' panel_output("panel1", "Application Complete", "Thank you for submitting your application.  Your reference is xvsiq")

panel_output <- function(InputId, main_text, sub_text) {
  tags$div(class="govuk-panel govuk-panel--confirmation", id = InputId,
    tags$h1(main_text, class = "govuk-panel__title"),
    tags$div(HTML(sub_text), class = "govuk-panel__body")
  )
}
