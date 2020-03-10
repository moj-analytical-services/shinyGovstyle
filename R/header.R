#' Header Function
#'
#' This function create a header banner.  For use at top of the screen
#' @param main_text Main text that goes in the header
#' @param secondary_text Secondary header to supplement the main text
#' @param logo Add a link to a logo which will apply in the header.
#' @param main_link Add a link for clicking on main text
#' @param secondary_link Add a link for clicking on secondary header.
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

header <- function(main_text, secondary_text, logo = NULL, main_link = "#", secondary_link = "#"){
  govHeader <- tags$header(class = "govuk-header", role = "banner",
    tags$div(class = "govuk-header__container govuk-width-container",
      tags$div(class = "govuk-header__logo",
        tags$a(href = main_link, class="govuk-header__link govuk-header__link--homepage",
          tags$span(class = "govuk-header__logotype",
            tags$img(src = logo, class = "govuk-header__logotype-crown-fallback-image"),
            tags$span(main_text, class = "govuk-header__logotype-text")
          )
        )
      ),
      tags$div(class = "govuk-header__content",
        tags$a(href = secondary_link, secondary_text, class = "govuk-header__link govuk-header__link--service-name")
      )
    )
  )
  attachDependency(govHeader)
}
