#' Radio Button Function
#'
#' This function create radio buttons
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Input label.
#' @param choices List of values to select from (if elements of the list are named
#'  then that name rather than the value is displayed to the user)
#' @param selected The initially selected value.
#' @param inline  If you want the radio inline or not,  Default is FALSE
#' @param choiceNames,choiceValues Same as in \code{\link[shiny]{checkboxGroupInput}}. List of names and values, respectively, that are displayed to
#'  the user in the app and correspond to the each choice (for this reason,
#' @param hint_label Additional hint text you may want to display below the label.  Defaults to NULL
#' @param error  Whenever you want to include error handle on the component.
#' @param error_message  If you want a default error message.
#' @keywords radiobuttons
#' @export
#' @examples
#' radio_button_input()

radio_button_Input <- function (inputId, label, choices = NULL,
                                selected = NULL, inline = FALSE,
                                choiceNames = NULL,
                                choiceValues = NULL, hint_label = NULL, error = FALSE,
                                error_message = NULL){
  args <- shiny:::normalizeChoicesArgs(choices, choiceNames, choiceValues)
  selected <- shiny::restoreInput(id = inputId, default = selected)
  selected <- if (is.null(selected))
    args$choiceValues[[1]]
  else as.character(selected)
  if (length(selected) > 1)
    stop("The 'selected' argument must be of length 1")
  options <- generateOptions2(inputId, selected, inline, "radio",
                              args$choiceNames, args$choiceValues)
  divClass <- "govuk-form-group govuk-radios"
  if (inline){
    divClass <- paste(divClass, "govuk-radios--inline")
  }
  else {
    divClass <- paste(divClass, "govuk-radios")
  }
  tags$div(id = inputId, class = divClass,
    tags$div(class="govuk-form-group", id=paste0(inputId,"div"),
    controlLabel2(inputId, label),
    tags$span(hint_label ,class="govuk-hint"),
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
    options))
}

controlLabel2 <- function(controlName, label) {
  label %AND% htmltools::tags$label(class = "govuk-label",
                                    `for` = controlName, label)
}

generateOptions2 <- function (inputId, selected, inline,
                              type = "checkbox", choiceNames,
                              choiceValues,
                              session = getDefaultReactiveDomain()){
  options <- mapply(choiceValues, choiceNames, FUN = function(value, name) {
    inputTag <- tags$input(type = type, name = inputId,
                           value = value, class = "govuk-radios__input")
    pd <- shiny:::processDeps(name, session)
    tags$div(class = "govuk-radios__item",
             tags$label(inputTag, tags$span(
               pd$html,
               pd$deps,
               class = "govuk-label govuk-radios__label")))

  },
  SIMPLIFY = FALSE, USE.NAMES = FALSE)
  if (inline){
    div(class = "govuk-radios govuk-radios--inline", options)
  }
  else {
    div(class = "govuk-radios govuk-radios", options)
  }
}

`%AND%` <- function (x, y) {
  if (!is.null(x) && !anyNA(x))
    if (!is.null(y) && !anyNA(y))
      return(y)
  return(NULL)
}
