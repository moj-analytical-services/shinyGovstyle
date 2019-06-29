#' Button Function
#'
#' This function create a gov style button
#' @inputId The input slot that will be used to access the value.
#' @label The contents of the button.
#' @type The type of button.  Options are default, start, secondary and warning.  Defaults to default.
#' @keywords button
#' @export
#' @examples
#' button_Input("btn1", "Continue", "default")

button_Input <- function(inputId, label, type = "default"){

  class_input <- "govuk-button"
  if (type == "start")
    class_input <- "govuk-button govuk-button--start"
  else if (type == "secondary")
    class_input <- "govuk-button govuk-button--secondary"
  else if (type == "warning")
    class_input <- "govuk-button govuk-button--warning"

  value <- shiny::restoreInput(id = inputId, default = NULL)

  tags$button(label, id = inputId, class = paste0(class_input, " action-button"), `data-val` = value)

}
