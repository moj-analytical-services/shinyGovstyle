#' Text Area Input Function
#'
#' This function create a text area input
#' @param main_text Text that goes in the main
#' @keywords text area
#' @export
#' @examples
#' text_area_input()

gov_button <- function(input_id, text, type = "default"){

  class_input <- "govuk-button"
  if (type == "start")
    class_input <- "govuk-button govuk-button--start"
  else if (type == "secondary")
    class_input <- "govuk-button govuk-button--secondary"
  else if (type == "warning")
    class_input <- "govuk-button govuk-button--warning"

  print(class_input)

  value <- shiny::restoreInput(id = input_id, default = NULL)

  tags$button(text, id = input_id, class = paste0(class_input, " action-button"), `data-val` = value)

}
