#' Text Area Input Function
#'
#' This function create a text area input
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param hint_label Display hint label for the control, or \code{NULL} for no hint label.
#' @param row_no Size of the text entry box.  Defaults to 5.
#' @param error Whenever to icnlud error handling  Defaults to \code{FALSE}
#' @param error_message Message to display on error.  Defaults to \code{NULL}
#' @param error_message Add a word limit to the display.  Defaults to \code{NULL}.
#' @keywords text area
#' @export
#' @examples
#' text_area_input("taId", "Can you provide more detail?",
#' "Do not include personal or financial information, like your National Insurance number or credit card details.")

text_area_Input <- function(inputId, label, hint_label=NULL, row_no=5, error = FALSE, error_message = NULL, word_limit=NULL){
  govTextarea <- tags$div(class="govuk-form-group govuk-character-count", id=paste0(inputId,"div"),
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
    tags$textarea(id=inputId, class="govuk-textarea", rows=row_no),
    if (!is.null(word_limit)){
      tags$span(id=paste0(inputId,"wc"), class="govuk-hint govuk-character-count__message",
                paste("You have used 0", "of the", word_limit, "allowed"))
    }
  )
  attachDependency(govTextarea)
}
