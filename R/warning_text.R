#' Warning Text Function
#'
#' This function create warning text
#' @param inputId The input slot that will be used to access the value.
#' @param text Text that goes in the main
#' @keywords warning
#' @export
#' @examples
#' warning_text("You can be fined up to £5,000 if you do not register.")

warning_text <- function(inputId, text){
  govWarning <- tags$div(class="govuk-warning-text", id = inputId,
    tags$span("!", class="govuk-warning-text__icon", `aria-hidden`="true"),
    tags$strong(text, class="govuk-warning-text__text",
      tags$span("Warning", class="govuk-warning-text__assistive")
    )
  )
  attachDependency(govWarning)
}
