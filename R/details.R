#' Details Function
#'
#' This function create a detail component that you can click for further details.
#' @param inputId The input slot that will be used to access the value.
#' @param label Main label text
#' @param hint_label Additional help information in the component.
#' @keywords text area
#' @export
#' @examples
#' details("help_div", "Help with form", "To complete the form you need to fill it in...")

details <-function(inputId, label, help_text){
  tags$details(class = "govuk-details", id = inputId,
    tags$summary(class = "govuk-details__summary",
      tags$span(class = "govuk-details__summary-text", label)
    ),
    tags$div(class = "govuk-details__text", help_text)
  )
}
