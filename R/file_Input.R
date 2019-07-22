#' File Input Function
#'
#' This function create a file upload component
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param error Whenever to icnlud error handling  Defaults to FALSE.
#' @param error_message Message to display on error.  Defaults to NULL
#' @keywords text area
#' @export
#' @examples
#' file_Input("file1", "Upload a file")

file_Input <- function(inputId, label = NULL, error = FALSE, error_message = NULL){
  govFile <- tags$div(class="govuk-form-group", id=paste0(inputId,"div"),
           tags$label(label, class="govuk-label"),
           if (error == TRUE){
             shinyjs::hidden(
               tags$span(error_message,
                         class="govuk-error-message",
                         id= paste0(inputId, "error"),
                         tags$span("Error:",
                                   class="govuk-visually-hidden")
               )
             )
           },
           tags$input(id=inputId, class="govuk-file-upload", id = inputId, type="file")
  )
  attachDependency(govFile)
}
