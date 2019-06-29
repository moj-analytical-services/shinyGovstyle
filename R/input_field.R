#' Checkbox Function
#'
#' This function inserts a label and optional hint
#' @param input_id Input id for the component
#' @param cb_labels Add the names of the options that will appear
#' @param cb_values Add the values that will create the div IDs in the form of paste(cb_,cb_values)
#' @param text_input Insert the text for the checkbox group.
#' @param widths Insert optional hint/secondary text.  Options are 30, 20, 10, 5, 4, 3, 2.  NULL will not limit the size
#' @keywords checkbox
#' @export
#' @examples
#' checkbox_input(c("Option 1", "Option 2", "Option 3"), c("op1", "op2", "op3"), "Choice option", "Lets go nuts")

input_field <- function(text_in, titles, ids, widths=NULL){
  tags$fieldset(class="govuk-fieldset",
    tags$legend(text_in, class="govuk-fieldset__legend govuk-fieldset__legend--xl"),
    Map(function(x, y, z){
      if (is.null(z)){
        width_class <- "govuk-input"
      }
      else{
        width_class <- paste0("govuk-input govuk-input--width-", z)
      }
      tags$div(class="govuk-form-group",
        tags$label(x, class="govuk-label"),
        tags$input(id=y, class=width_class)
      )
    }, x = titles, y = ids, z = widths)
  )
}
