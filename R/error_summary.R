#' Error Summary Function
#'
#' This function produces an error summary box as can be seen here:
#' https://design-system.service.gov.uk/components/error-summary/
#' @param inputId The input id that you to to turn the error on for.
#' @param error_message if you want to add an additional error message.
#' Defaults to NULL, showing the original designed error message
#' @return no return value.  This toggles on error css
#' @keywords error
#' @export
#' @examples
## Only run examples in interactive R sessions
# if (interactive()) {
  # TODO Remove
  library(shiny)
  ui <- fluidPage(
    shinyGovstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovstyle/images/moj_logo.png"),
    shinyGovstyle::gov_layout(size = "two-thirds",
      shinyGovstyle::error_summary(
        inputId = ,
        main_text = "main",
        failed_pages = "list",
        fail_msg = "failed msg"
      )
    ),
    shinyGovstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
# }
  
error_summary <- function(inputId, main_text = "", failed_pages = "", fail_msg = "") {
  govErrorSummary <-
    tags$div(
      id = inputId,
      class = "govuk-error-summary",
      tags$h2(main_text, class = "govuk-error-summary__title"),
      tags$div(class = "govuk-error-summary__body",
               tags$ul(class = "govuk-list govuk-error-summary__list",
                       Map(function(x){
                         tags$li(x)
                       }, x = failed_pages)
               ),
               tags$p(fail_msg)
      )
    )
  # version <- as.character(packageVersion("shinyGovstyle")[[1]])
  # 
  # dep <- htmltools::htmlDependency(
  #   name = "stylecss", version = version,
  #   src = c(href="shinyGovstyle/css"),
  #   stylesheet = "govuk-frontend-norem.css"
  # )
  # htmltools::attachDependencies(govErrorSummary, dep, append = TRUE)
  attachDependency(govErrorSummary)
}