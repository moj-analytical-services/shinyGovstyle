#' Checkbox Function
#'
#' This function inserts a label and optional hint
#' @param input_id Input id for the component
#' @param cb_labels Add the names of the options that will appear
#' @param cb_values Add the values that will create the div IDs in the form of paste(cb_,cb_values)
#' @param text_input Insert the text for the checkbox group.
#' @param hint_text Insert optional hint/secondary text.  Defaults to NULL
#' @param small change the sizing to a small version of the checkbox.  Defaults to \code{FALSE}
#' @keywords checkbox
#' @export
#' @examples
#' checkbox_input(c("Option 1", "Option 2", "Option 3"), c("op1", "op2", "op3"), "Choice option", "Lets go nuts")

checkbox_input <- function(cb_labels, inputIds, text_input, hint_input = NULL, small = FALSE){
  if (small){
    class_build <- "govuk-checkboxes govuk-checkboxes--small"
  } else {
    class_build <- "govuk-checkboxes"
  }

  govCheckboxes <- tags$div(class="govuk-form-group shiny-input-checkboxgroup", id = "test",
    tags$fieldset(class="govuk-fieldset",
      tags$label(text_input, class="govuk-label"),
      tags$span(hint_input, class="govuk-hint"),
      tags$div(class=class_build,
        Map(function(x, y) {
          value <- restoreInput(id = y, default = FALSE)
          tags$div(class="govuk-checkboxes__item", id=paste0("div_", y),
          tags$input(class="govuk-checkboxes__input",
                     id=y,
                     name="method",
                     type="checkbox",
                     value=y),
          tags$label(x, class="govuk-label govuk-checkboxes__label"))
        },
        x=cb_labels, y = inputIds)
      )
    )
  )
  attachDependency(govCheckboxes)
}

