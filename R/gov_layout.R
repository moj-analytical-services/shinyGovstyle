#' Page Layout Function
#'
#' This function loads the page layout
#' @param inputID ID of the main div.  Defaults to "main"
#' @param size Layout of the page.  Optional are full, one-half, two-thrids, one-thrid and one-quarter.  Defaults to "full"
#' @param ... include the components of the UI that you want within the main page.
#' @keywords style
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovstyle/images/moj_logo.png"),
#'     shinyGovstyle::gov_layout(size = "full",
#'       shinyGovstyle::panel_output(
#'         inputId = "panel1",
#'         main_text = "Application Complete",
#'         sub_text = "Thank you for submitting your application.  Your reference is xvsiq")
#'     ),
#'     shinyGovstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }

gov_layout <- function(..., inputID = "main", size="full"){
  govLayout <- tags$div(id = inputID, class="govuk-width-container  govuk-main-wrapper",
    tags$div(id = paste0(inputID,"_sub"), class=paste0("govuk-grid-column-",size), ...)
  )
  attachDependency(govLayout)
}
