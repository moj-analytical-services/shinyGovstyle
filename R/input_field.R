#' Input Field Function
#'
#' This function inserts number of text inputs. Useful for addresses.
#' @param legend Lengand that goes above the fieldset
#' @param labels A list of labels for the text inputs
#' @param inputIds A list input slots that will be used to access the value.
#' @param widths control the size of the box based on number of characters required.  Options are 30, 20, 10, 5, 4, 3, 2.  NULL will not limit the size
#' @keywords input field
#' @export
#' @examples
#' input_field("List of three text boxes", c("Option 1", "Option 2", "Option 3"), c("op1", "op2", "op3"))

input_field <- function(legend, labels, inputIds, widths=NULL){
  govInputField <- tags$fieldset(class="govuk-fieldset",
    tags$legend(legend, class="govuk-fieldset__legend govuk-fieldset__legend--xl"),
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
    }, x = labels, y = inputIds, z = widths)
  )
  attachDependency(govInputField)
}
