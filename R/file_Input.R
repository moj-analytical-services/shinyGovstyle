#' File Input Function
#'
#' This function create a file upload component.  It uses the basis of the shiny fileInput function, but restyles the label and
#' adds error onto it.  It doesn't look like the gov.uk style one, although this gov.uk doesn't seem to have a settle style as,
#' for example it changes between firefox and chrome
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param multiple Whether the user should be allowed to select and upload multiple files at once. Does not work on older browsers, including Internet Explorer 9 and earlier.
#' @param accept A character vector of MIME types; gives the browser a hint of what kind of files the server is expecting.
#' @param width	The width of the input, e.g. '400px', or '100%'; see validateCssUnit().
#' @param buttonLabel The label used on the button. Can be text or an HTML tag object.
#' @param placeholder	The text to show before a file has been uploaded.
#' @param error Whenever to icnlud error handling  Defaults to FALSE.
#' @param error_message Message to display on error.  Defaults to NULL
#' @keywords file input
#' @export
#' @examples
#' file_Input("file1", "Upload a file")

file_Input <- function(inputId, label, multiple = FALSE, accept = NULL,
                      width = NULL, buttonLabel = "Choose file", placeholder = "No file chosen",
                      error = FALSE, error_message = NULL) {

  restoredValue <- restoreInput(id = inputId, default = NULL)

  # Catch potential edge case - ensure that it's either NULL or a data frame.
  if (!is.null(restoredValue) && !is.data.frame(restoredValue)) {
    warning("Restored value for ", inputId, " has incorrect format.")
    restoredValue <- NULL
  }

  if (!is.null(restoredValue)) {
    restoredValue <- toJSON(restoredValue, strict_atomic = FALSE)
  }

  inputTag <- tags$input(
    id = inputId,
    name = inputId,
    type = "file",
    style = "display: none;",
    `data-restore` = restoredValue
  )

  if (multiple)
    inputTag$attribs$multiple <- "multiple"
  if (length(accept) > 0)
    inputTag$attribs$accept <- paste(accept, collapse=',')


  div(id = paste0(inputId, "div"), class = "govuk-form-group",


      style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
      tags$label(label, class="govuk-label"),
      if (error == TRUE){
        shinyjs::hidden(
          tags$span(error_message,
            class="govuk-error-message",
            id= paste0(inputId, "error"),
            tags$span("Error:", class="govuk-visually-hidden")
          )
        )
      },

      div(id = paste0(inputId,"file_div"), class = "input-group",
          tags$label(class = "input-group-btn",
                     span(class = "btn btn-default btn-file",
                          buttonLabel,
                          inputTag
                     )
          ),
          tags$input(type = "text", class = "form-control",
                     placeholder = placeholder, readonly = "readonly"
          )
      )
  )
  attachDependency(govFile)
}
