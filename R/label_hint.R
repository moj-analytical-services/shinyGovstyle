#' Label with Hint Function
#'
#' This function inserts a label and optional hint
#' @param input_id Input id for the component
#' @param text_input Insert the main text
#' @param hint_text Insert optional hint/secondary text.  Defaults to NULL
#' @keywords label
#' @export
#' @examples
#' label_hint("This is a label", "This is a hint")

label_hint <- function(text_input, hint_input = NULL){
  tags$div(class="govuk-form-group",
    tags$label(text_input, class="govuk-label"),
    tags$span(hint_input, class="govuk-hint")
  )
}
