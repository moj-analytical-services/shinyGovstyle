#' Text Input Function
#'
#' This function create a text area input
#' @param input_id Input id for the component
#' @param label_text Main text above the text area input
#' @param hint_text Secondary text for the text area box. Defaults to NULL
#' @param row_no Size of the text entry box.  Defaults to 5.
#' @param error Whenever to icnlud error handling  Defaults to FALSE.
#' @param error_message Message to display on error.  Defaults to NULL
#' @keywords text area
#' @export
#' @examples
#' text_area_input()

text_Input <- function(input_id, label_text, hint_text=NULL, error = FALSE, error_message = NULL){
  tags$div(class="govuk-form-group", id=paste0(input_id,"div"),
    tags$label(label_text, class="govuk-label"),
    tags$span(hint_text ,class="govuk-hint"),
    if (error == TRUE){
      shinyjs::hidden(
        tags$span(error_message,
          class="govuk-error-message",
          id= paste0(input_id, "error"),
          tags$span("Error:",
          class="govuk-visually-hidden")
        )
      )
    },
    tags$input(id=input_id, class="govuk-input")
  )
}
