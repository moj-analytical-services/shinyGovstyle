#' Skip to Main Content Link
#'
#' This function generates an accessible "Skip to main content" link,
#' which is typically used by keyboard-only users to bypass repetitive content and navigate directly to the main content of a page.
#'
#' @param href The `href` attribute specifying the target ID of the
#' main content. Defaults to "#main-content".
#' @param link_text The text to display for the skip link.
#' Defaults to "Skip to main content".
#'
#' @return An HTML `div` element containing the skip link.
#' This div is initially hidden and styled as a yellow banner.
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovstyle/images/moj_logo.png"
#'     ),
#'     # Include the skip to main content link
#'     shinyGovstyle::skip_to_main(),
#'     shinyjs::useShinyjs(),  # shinyjs is needed to manage visibility of elements
#'     shinyGovstyle::cookieBanner("Example Service"),  # Include the cookie banner
#'     div(
#'       id = "main-content",
#'       h1("Main Content"),
#'       p("This is the main content of the app.")
#'     ),
#'     shinyGovstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {
#'     observeEvent(input$cookieAccept, {
#'       shinyjs::show(id = "skipToMainDiv")  # Show skip link when cookies are accepted
#'       shinyjs::hide(id = "cookieDiv")      # Hide the cookie banner
#'       shinyjs::show(id = "cookieAcceptDiv")
#'     })
#'
#'     observeEvent(input$cookieReject, {
#'       shinyjs::show(id = "skipToMainDiv")  # Show skip link when cookies are rejected
#'       shinyjs::hide(id = "cookieDiv")      # Hide the cookie banner
#'       shinyjs::show(id = "cookieRejectDiv")
#'     })
#'
#'     observeEvent(input$hideAccept, {
#'       shinyjs::hide(id = "cookieAcceptDiv")
#'     })
#'
#'     observeEvent(input$hideReject, {
#'       shinyjs::hide(id = "cookieRejectDiv")
#'     })
#'   }
#'
#'   shinyApp(ui = ui, server = server)
#' }
#'
#' @export
skip_to_main <-
  function(href = "#main-content", link_text = "Skip to main content") {
  shiny::tags$div(
    id = "skipToMainDiv",
    class = "govuk-yellow-banner",
    style = "background-color: yellow; padding: 10px; display: none;",
    shiny::tags$a(
      href = href,
      class = "govuk-skip-link__link",
      link_text
    )
  )
}


