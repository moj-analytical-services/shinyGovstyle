#' Header Function
#'
#' This function create a header banner.  For use at top of the screen
#' @param main_text Main text that goes in the header
#' @param main_link Add a link for clicking on main text
#' @param secondary_text Secondary header to supplement the main text
#' @param secondary_link Add a link for clicking on secondary header.
#' @param logo Add a link to a logo which will apply in the header.
#' @keywords header
#' @export
#' @examples
#' header("My site", "", "A place to have fun", "", "https://upload.wikimedia.org/wikipedia/commons/c/c4/2-Dice-Icon.svg")

header <- function(main_text, main_link, secondary_text, secondary_link, logo){
  tags$header(class = "govuk-header", role = "banner",
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
}
