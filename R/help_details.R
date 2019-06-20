#' Help Detail Function
#'
#' This function create a detail component that you can click for further details.
#' @param input_id Input id for the component
#' @param title Main display text
#' @param hint_text Further information to display once clicked
#' @keywords text area
#' @export
#' @examples
#' help_details("help_div", "Help with form", "To complete the form you need to fill it in...")

help_details <-function(input_id, title, help_text){
  tags$details(class = "govuk-details", id = input_id,
    tags$summary(class = "govuk-details__summary",
      tags$span(class = "govuk-details__summary-text", title)
    ),
    tags$div(class = "govuk-details__text", help_text)
  )
}
