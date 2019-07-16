#' Error off Function
#'
#' This function turns off the the error o the component, once issues have been sorted.
#' @param inputId The inputId to turn error handling iff for on for.
#' @keywords error
#' @export
#' @examples
#' error_off("inputId")

error_off <- function(inputId){
  shinyjs::removeClass(paste0(inputId, "div"), "govuk-form-group--error")
  shinyjs::hide(paste0(inputId, "error"))
  shinyjs::removeClass(selector = paste0("#", inputId,"div :input"), class = "govuk-textarea--error")
}
