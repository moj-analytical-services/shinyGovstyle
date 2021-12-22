#' Error Summary Function
#'
#' This function loads the error summary component to display error text.
#' This replicates the gov style error boxes linked below:
#' https://design-system.service.gov.uk/components/error-summary/
#' @param inputId The input slot that will be used to access the value.
#' @param error_title The title for the error summary.
#' @param error_list A list of text values to be displayed in the error body.
#' @return no return value.  This toggles on error css
#' @keywords error_summary
#' @export
#' @examples
## Only run examples in interactive R sessions
# if (interactive()) {
#   ui <- fluidPage(
#     shinyGovstyle::header(
#       main_text = "Example",
#       secondary_text = "User Examples",
#       logo = "shinyGovstyle/images/moj_logo.png"
#     ),
#     shinyGovstyle::gov_layout(
#       size = "two-thirds",
#       myerror(
#         inputId = "errorId",
#         error_title = "Error title",
#         error_list = c("error item1", "error item2")
#       )
#     ),
#     shinyGovstyle::footer(full = TRUE)
#   )
#
#   server <- function(input, output, session) {
#   }
#   shinyApp(ui = ui, server = server)
# }

error_summary <-
  function(inputId,
           error_title,
           error_list) {
    govErrorSummary <-
      shiny::tags$div(
        id = inputId,
        class = "govuk-error-summary",
        shiny::tags$h2(error_title, class = "govuk-error-summary__title"),
        shiny::tags$div(
          class = "govuk-error-summary__body",
          shiny::tags$ul(class = "govuk-list govuk-error-summary__list",
                         Map(function(x) {
                           shiny::tags$li(x)
                         }, x = error_list))
        )
      )
    attachDependency(govErrorSummary)
  }
