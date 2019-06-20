#' Checkbox Function
#'
#' This function inserts a label and optional hint
#' @param input_id Input id for the component
#' @param cb_labels Add the names of the options that will appear
#' @param cb_values Add the values that will create the div IDs in the form of paste(cb_,cb_values)
#' @param text_input Insert the text for the checkbox group.
#' @param hint_text Insert optional hint/secondary text.  Defaults to NULL
#' @keywords checkbox
#' @export
#' @examples
#' checkbox_input(c("Option 1", "Option 2", "Option 3"), c("op1", "op2", "op3"), "Choice option", "Lets go nuts")

checkbox_input <- function(cb_labels, cb_values, text_input, hint_input = NULL){
  tags$div(class="govuk-form-group",
    tags$fieldset(class="govuk-fieldset",
      tags$label(text_input, class="govuk-label"),
      tags$span(hint_input, class="govuk-hint"),
      tags$div(class="govuk-checkboxes",
        Map(function(x, y) {
          value <- restoreInput(id = paste0("methodology-", y), default = FALSE)
          tags$div(class="govuk-checkboxes__item", id=paste0("cb_div_", y),
          tags$input(class="govuk-checkboxes__input",
                     id=paste0("cb_", y),
                     name="method",
                     type="checkbox",
                     value=y),
          tags$label(x, class="govuk-label govuk-checkboxes__label"))
        },
        x=cb_labels, y = cb_values)
      )
    )
  )
}

