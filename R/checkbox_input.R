#' Checkbox Function
#'
#' This function inserts a checkbox group
#' @param input_id Input id for the group of checkboxes
#' @param cb_labels Add the names of the options that will appear
#' @param checkboxIds Add the values for each checkbox
#' @param text_input Insert the text for the checkbox group.
#' @param hint_text Insert optional hint/secondary text.  Defaults to NULL
#' @param small change the sizing to a small version of the checkbox.  Defaults to \code{FALSE}
#' @keywords checkbox
#' @export
#' @examples
#' checkbox_input(c("Option 1", "Option 2", "Option 3"), c("op1", "op2", "op3"), "Choice option", "Lets go nuts")

checkbox_Input <- function(inputId, cb_labels, checkboxIds, text_input, hint_input = NULL, small = FALSE,
                           error = FALSE, error_message = NULL){
  if (small){
    class_build <- "govuk-checkboxes govuk-checkboxes--small"
  } else {
    class_build <- "govuk-checkboxes"
  }

  govCheckboxes <- tags$div(class="shiny-input-checkboxgroup", id = inputId,
    tags$div(class="govuk-form-group", id=paste0(inputId,"div"),
    tags$fieldset(class="govuk-fieldset",
      tags$label(text_input, class="govuk-label"),
      tags$span(hint_input, class="govuk-hint"),
      if (error == TRUE){
        shinyjs::hidden(
          tags$span(error_message,
                    class="govuk-error-message",
                    id= paste0(inputId, "error"),
                    tags$span("Error:",
                              class="govuk-visually-hidden")
          )
        )
      },
      tags$div(class=class_build,
        Map(function(x, y) {
          value <- restoreInput(id = y, default = FALSE)
          tags$div(class="govuk-checkboxes__item", id=paste0("div_", y),
          tags$input(class="govuk-checkboxes__input",
                     id=y,
                     name=inputId,
                     type="checkbox",
                     value=y),
          tags$label(x, class="govuk-label govuk-checkboxes__label"))
        },
        x=cb_labels, y = checkboxIds)
      )
    )
  ))
  attachDependency(govCheckboxes)
}

