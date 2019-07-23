#' Date Input Function
#'
#' This function create a date input that follows gds component
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param hint_label Display hint label for the control, or \code{NULL} for no hint label.
#' @param error Whenever to include error components.Defaults to \code{FALSE}.
#' @param error_message Error handling message? Defaults to \code{NULL}
#' @keywords date
#' @export
#' @examples
#' date_Input("dob_input", Please enter your birthday", ""For example, 12 11 2007")

date_Input <- function(inputId, label, hint_label = NULL, error = FALSE, error_message = NULL){
  value <- restoreInput(id = inputId, default = FALSE)
  govDate <- tags$div(class="govuk-form-group", id=paste0(inputId,"div"),
    tags$fieldset(class="govuk-fieldset",
      tags$label(label, class="govuk-label"),
      if (error == TRUE){
        shinyjs::hidden(
          tags$span(error_message, id = paste0(inputId,"error"), class = "govuk-error-message",
            tags$span("Error:", class = "govuk-visually-hidden")
          )
        )
      },
      tags$span(hint_label, class="govuk-hint"),
        tags$div(class="govuk-date-input", id = inputId,
          tags$div(class="govuk-date-input__item",
            tags$div(class="govuk-form-group",
              tags$label("Day", class="govuk-label govuk-date-input__label"),
              tags$input(class="govuk-input govuk-date-input__input govuk-input--width-2",
                         id=paste0(inputId,"_day"), name=inputId,
                         type="number", pattern="[0-9]*")
            )
          ),
        tags$div(class="govuk-date-input__item",
          tags$div(class="govuk-form-group",
            tags$label("Month", class="govuk-label govuk-date-input__label"),
            tags$input(class="govuk-input govuk-date-input__input govuk-input--width-2",
                       id=paste0(inputId,"_month"), name=inputId,
                       type="number", pattern="[0-9]*")
            )
        ),
        tags$div(class="govuk-date-input__item",
          tags$div(class="govuk-form-group",
            tags$label("Year", class="govuk-label govuk-date-input__label"),
            tags$input(class="govuk-input govuk-date-input__input govuk-input--width-4",
                       id=paste0(inputId,"_year"), name=inputId,
                       type="number", pattern="[0-9]*")
          )
        )
      )
    )
  )
  attachDependency(govDate, "date")
}
