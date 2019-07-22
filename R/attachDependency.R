#' Attach shinyGovstyle dependancies
#'
#' @param tag An object which has (or should have) HTML dependencies.
#' @param widget Name of a widget for particular dependancies
#'
#' @noRd
#' @importFrom utils packageVersion
#' @importFrom htmltools htmlDependency attachDependencies findDependencies

attachDependency <- function(tag, widget = NULL) {

  version <- as.character(packageVersion("shinyWidgets")[[1]])

  dep <- htmltools::htmlDependency(
    name = "stylecss", version = version,
    src = c(href="shinyGovstyle/css"),
    stylesheet = "govuk-frontend-norem.css"
  )

  if (!is.null(widget)) {
    if (widget == "radio") {
      dep <- list(
        dep,
        htmltools::htmlDependency(
          name = "radio_button_Input",
          version = version,
          src = c(href="shinyWidgets/js"),
          script = "radio_button_input_binding.js"
        )
      )
    }
    # else if (widget == "awesome") {
    #   dep <- list(
    #     dep,
    #     htmltools::htmlDependency(
    #       name = "awesome-bootstrap",
    #       version = "0.2.0",
    #       src = c(href = "shinyWidgets/awesomeRadioCheckbox"),
    #       stylesheet = "css/awesome-bootstrap-checkbox-shiny.css"
    #     ),
    #     htmltools::findDependencies(shiny::icon("rebel"))[[1]]
    #   )
    # }
  }
  htmltools::attachDependencies(tag, dep, append = TRUE)
}
