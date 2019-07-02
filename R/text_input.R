#' Text Input Function
#'
#' This function create a text area input
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param hint_label Display hint label for the control, or \code{NULL} for no hint label.
#' @param row_no Size of the text entry box.  Defaults to 5.
#' @param error Whenever to icnlud error handling  Defaults to FALSE.
#' @param error_message Message to display on error.  Defaults to NULL
#' @param width control the size of the box based on number of characters required.  Options are 30, 20, 10, 5, 4, 3, 2.  NULL will not limit the size
#' @keywords text input
#' @export
#' @examples
#' text_Input("eventId", "Event Name")

text_Input <- function(inputId, label, hint_label=NULL, type = "text", width = NULL, error = FALSE, error_message = NULL){
  if (is.null(width)){
    width_class <- "govuk-input"
  }
  else{
    width_class <- paste0("govuk-input govuk-input--width-", width)
  }
  tags$div(class="govuk-form-group", id=paste0(inputId,"div"),
    tags$label(label, class="govuk-label"),
    tags$span(hint_label ,class="govuk-hint"),
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
    tags$input(id=inputId, class=width_class, type = type)
  )
}
