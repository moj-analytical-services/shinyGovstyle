#' Date Entry Function
#'
#' This function create a date input that follows gds component
#' @param input_id Input ID so that you can select the compoenent
#' @param label_text Text to show above the data entry.
#' @param hint_text Hint text to show below the main text. Defaults to NULL
#' @param error Whenever to include error components.Defaults to FALSE.
#' @param error_message Error handling message? Defaults to "Please enter a date"
#' @keywords date
#' @export
#' @examples
#' date_entry("dob_input", Please enter your birthday", ""For example, 12 11 2007")

date_entry <- function(input_id, label_text, hint_text = NULL, error = FALSE, error_message = "Please enter a date"){
  tags$div(class="govuk-form-group", id=paste0(input_id,"div"),
    tags$fieldset(class="govuk-fieldset",
      tags$label(label_text, class="govuk-label"),
      if (error == TRUE){
        shinyjs::hidden(
          tags$span(error_message, id = paste0(input_id,"error"), class = "govuk-error-message",
            tags$span("Error:", class = "govuk-visually-hidden")
          )
        )
      },
      tags$span(hint_text, class="govuk-hint"),
        tags$div(class="govuk-date-input",
          tags$div(class="govuk-date-input__item",
            tags$div(class="govuk-form-group",
              tags$label("Day", class="govuk-label govuk-date-input__label"),
              tags$input(class="govuk-input govuk-date-input__input govuk-input--width-2",
                         id=paste0(input_id,"_day"), name=paste0(input_id,"_day"),
                         type="number", pattern="[0-9]*")
            )
          ),
        tags$div(class="govuk-date-input__item",
          tags$div(class="govuk-form-group",
            tags$label("Month", class="govuk-label govuk-date-input__label"),
            tags$input(class="govuk-input govuk-date-input__input govuk-input--width-2",
                       id=paste0(input_id,"_month"), name=paste0(input_id,"_month"),
                       type="number", pattern="[0-9]*")
            )
        ),
        tags$div(class="govuk-date-input__item",
          tags$div(class="govuk-form-group",
            tags$label("Year", class="govuk-label govuk-date-input__label"),
            tags$input(class="govuk-input govuk-date-input__input govuk-input--width-4",
                       id=paste0(input_id,"_year"), name=paste0(input_id,"_year"),
                       type="number", pattern="[0-9]*")
          )
        )
      )
    )
  )
}
