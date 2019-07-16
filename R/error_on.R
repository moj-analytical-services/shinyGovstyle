#' Error on Function
#'
#' This function turns on the the error o the component.  Can be used to validate inputs.
#' @param inputId The input id that you to to turn the error on for.
#' @param error_message if you want to add an additional error message.  Defaults to NULL, showing the original designed error message
#' @keywords error
#' @export
#' @examples
#' error_on("inputId", "You have not inputed a number")

error_on <- function(inputId, error_message = NULL){
  shinyjs::addClass(paste0(inputId, "div"), "govuk-form-group--error")
  if (!is.null(error_message)){
    shinyjs::html(paste0(inputId, "error"), error_message)
  }
  shinyjs::show(paste0(inputId, "error"))
  shinyjs::addClass(selector = paste0("#", inputId,"div :input"), class = "govuk-textarea--error")
}
