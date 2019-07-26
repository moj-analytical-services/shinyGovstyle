#' Banner Function
#'
#' This function create a detail component that you can click for further details.
#' @param inputId The input slot that will be used to access the value.
#' @param type Main type of label e.g. alpha or beta
#' @param hint_label test to display.
#' @keywords banner
#' @export
#' @examples
#' banner("banner", "beta", "This is a new service – your <a class="govuk-link" href="#">feedback</a> will help us to improve it.")
#'

banner <-function(inputId, type, label){
  govBanner <- tags$div(class="govuk-phase-banner govuk-width-container govuk-main-wrapper", id = inputId,
    tags$p(class="govuk-phase-banner__content",
      tags$strong(class="govuk-tag govuk-phase-banner__content__tag ", type),
      tags$span(class="govuk-phase-banner__text", HTML(label))
    )
  )
  attachDependency(govBanner)
}
