#' Label with Hint Function
#'
#' This function inserts a label and optional hint
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param hint_label Display hint label for the control, or \code{NULL} for no hint label.
#' @keywords label
#' @export
#' @examples
#' label_hint("This is a label", "This is a hint")

label_hint <- function(inputId, label, hint_input = NULL){
  tags$div(class="govuk-form-group", id = inputId,
    tags$label(label, class="govuk-label"),
    tags$span(hint_input, class="govuk-hint")
  )
}
