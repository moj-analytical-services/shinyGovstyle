#' File Upload Function
#'
#' This function create a file upload component
#' @param input_id Input id for the component
#' @param label_text Main text.  Defaults to "Upload a file"
#' @param error Whenever to icnlud error handling  Defaults to FALSE.
#' @param error_message Message to display on error.  Defaults to NULL
#' @keywords text area
#' @export
#' @examples
#' text_area_input()

file_upload <- function(input_id, label_text = "Upload a file", error = FALSE, error_message = NULL){
  tags$div(class="govuk-form-group", id=paste0(input_id,"div"),
           tags$label(label_text, class="govuk-label"),
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
           tags$input(id=input_id, class="govuk-file-upload", id = input_id, type="file")
  )
}
