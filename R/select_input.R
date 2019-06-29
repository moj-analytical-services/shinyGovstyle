#' Select Box Function
#'
#' This function inserts a label and optional hint
#' @param input_id Input id for the component
#' @param label_text Insert the text for the label.
#' @param select_text Add the text that will apply in the dropdown as a list
#' @param select_value Add the value that will be used for each selection.
#' @keywords select box
#' @export
#' @examples
#' select_input("sorter", "Sort by", c("Recently published", "Recently updated", "Most views", "Most comments"), c("published", "updated", "view", "comments"))

select_Input <- function(input_id, label_text, select_text, select_value){
  tags$div(lass="govuk-form-group",
    tags$label(label_text, class="govuk-label"),
    tags$select(id = input_id, class="govuk-select",
      Map(function(x,y){
        tags$option(value = y, x)
        }, x = select_text, y = select_value
      )
    )
  )
}
