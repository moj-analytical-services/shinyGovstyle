#' Label with Hint Function
#'
#' This function inserts a label and optional hint
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param hint_input Display hint label for the control, or \code{NULL} for no hint label.
#' @keywords label
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovstyle/images/moj_logo.png"),
#'     shinyGovstyle::gov_layout(size = "two-thirds",
#'       label_hint(
#'         inputId = "label1",
#'         label = "This is a label",
#'         hint_input = "This is a hint")
#'     ),
#'     shinyGovstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }

label_hint <- function(inputId, label, hint_input = NULL){
  govLabel <- tags$div(class="govuk-form-group", id = inputId,
    tags$label(HTML(label), class="govuk-label"),
    tags$span(hint_input, class="govuk-hint")
  )
  attachDependency(govLabel)
}
