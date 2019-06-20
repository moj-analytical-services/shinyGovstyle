#' Warning Text Function
#'
#' This function create warning text
#' @param text Text that goes in the main
#' @keywords warning
#' @export
#' @examples
#' warning_text("You can be fined up to £5,000 if you do not register.")

warning_text <- function(text){
  tags$div(class="govuk-warning-text",
    tags$span("!", class="govuk-warning-text__icon", `aria-hidden`="true"),
    tags$strong(text, class="govuk-warning-text__text",
      tags$span("Warning", class="govuk-warning-text__assistive")
    )
  )
}
