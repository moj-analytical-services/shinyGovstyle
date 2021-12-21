#' Accordion Function
#'
#' This function inserts a accordion
#' @param inputId Input id for the accordion
#' @param titles Add the titles for the accordion
#' @param descriptions Add the main text for the accordion
#' @return an accordion html shiny object
#' @keywords accordion
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovstyle/images/moj_logo.png"),
#'     shinyGovstyle::banner(
#'       inputId = "banner", type = "beta", 'This is a new service'),
#'     shinyGovstyle::gov_layout(size = "two-thirds",
#'     accordion(
#'       "acc1",
#'       c("Writing well for the web",
#'         "Writing well for specialists",
#'         "Know your audience",
#'         "How people read"
#'        ),
#'       c("This is the content for Writing well for the web.",
#'         "This is the content for Writing well for specialists.",
#'         "This is the content for Know your audience.",
#'         "This is the content for How people read."
#'        ))),
#'
#'     shinyGovstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }

accordion <- function(inputId, titles, descriptions){

  count_array <- seq(length(titles))

  accordion_div <-
    shiny::tags$div(
      class = "govuk-accordion js-enabled",
      `data-module` = "govuk-accordion",
      id = inputId,
    Map(function(x, y, z) {
      shiny::tags$div(
        class="govuk-accordion__section",
        shiny::tags$div(
          class="govuk-accordion__section-header",
          shiny::tags$h2(
            shiny::tags$button(
              class = "govuk-accordion__section-button",
              id = paste0("accordion-default-heading-", z),
              name = paste0("accordion-default-heading-", z),
              x,
              shiny::tags$span(
                class = "govuk-accordion__icon",
                `aria-hidden` = "true"
              )
            )
          )
        ),
        shiny::tags$div(
          id = "accordion-default-content-1",
          class="govuk-accordion__section-content",
          `aria-labelledby` = paste0("accordion-default-heading-", z),
          shiny::tags$p(
            class = "govuk-body",
            y
          )
        )

      )}, x = titles, y = descriptions, z = count_array
    )
    )
  attachDependency(accordion_div, "accordion")
  }

