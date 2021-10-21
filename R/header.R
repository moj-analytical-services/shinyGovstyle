#' Header Function
#'
#' This function create a header banner.  For use at top of the screen
#' @param main_text Main text that goes in the header
#' @param secondary_text Secondary header to supplement the main text
#' @param logo Add a link to a logo which will apply in the header.
#' @param main_link Add a link for clicking on main text
#' @param secondary_link Add a link for clicking on secondary header.
#' @return a header html shiny object
#' @keywords header
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovstyle/images/moj_logo.png")
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }

header <- function(main_text, secondary_text, logo = NULL,
                   main_link = "#", secondary_link = "#"){
  govHeader <- shiny::tags$header(class = "govuk-header", role = "banner",
    shiny::tags$div(class = "govuk-header__container govuk-width-container",
      shiny::tags$div(class = "govuk-header__logo",
        shiny::tags$a(href = main_link,
                      class="govuk-header__link govuk-header__link--homepage",
          shiny::tags$span(class = "govuk-header__logotype",
            shiny::tags$img(
              src = logo,
              class = "govuk-header__logotype-crown-fallback-image"
            ),
            shiny::tags$span(main_text, class = "govuk-header__logotype-text")
          )
        )
      ),
      shiny::tags$div(class = "govuk-header__content",
        shiny::tags$a(
          href = secondary_link, secondary_text,
          class = "govuk-header__link govuk-header__link--service-name"
        )
      )
    )
  )
  attachDependency(govHeader)
}
