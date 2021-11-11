
headers <- c("Name", "Date of birth", "Contact information", "Contact details")
info <- c("Sarah Philips",
          "5 January 1978", "72 Guild Street <br> London <br> SE23 6FH",
          "07700 900457 <br> sarah.phillips@example.com")

gov_summary <- function(headers, info, action = FALSE, border = TRUE){

  if (border){
    border_class = "govuk-summary-list"
  } else {
    border_class = "govuk-summary-list govuk-summary-list--no-border"
  }

  if (action == TRUE) {
    gov_sum <- action_summary(headers, info, border_class)
  } else {
    gov_sum <- plain_summary(headers, info, border_class)
  }
}


plain_summary <- function(headers, info, borderClass) {
  shiny::tags$dl(
    class = borderClass,
    Map(function(x, y){
      shiny::tags$div(
        class = "govuk-summary-list__row",
        shiny::tags$dt(
          class = "govuk-summary-list__key",
          x
        ),
        shiny::tags$dd(
          class = "govuk-summary-list__value",
          shiny::HTML(y)
        )
      )
    }, x = headers, y = info)
  )
}

action_summary <- function(headers, info, borderClass) {

  actions_name <- tolower(gsub(" ", "_", headers))

  shiny::tags$dl(
    class = borderClass,
    Map(function(x, y, z){
      shiny::tags$div(
        class = "govuk-summary-list__row",
        shiny::tags$dt(
          class = "govuk-summary-list__key",
          x
        ),
        shiny::tags$dd(
          class = "govuk-summary-list__value",
          shiny::HTML(y)
        ),
        shiny::tags$dd(
          class = "govuk-summary-list__actions",
          shiny::tags$button(
            "Change",
            id = z,
            class = "govuk-link action-button",
            `data-val` = shiny::restoreInput(id = z, default = NULL)
          )
        )
      )
    }, x = headers, y = info, z = actions_name)
  )

}

