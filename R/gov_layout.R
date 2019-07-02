#' Page LayoutFunction
#'
#' This function loads the page layout
#' @param inputID ID of the main div.  Defaults to "main"
#' @param size Layout of the page.  Optional are full, one-half, two-thrids, one-thrid and one-quarter.  Defaults to "full"
#' @param ... include the components of the UI that you want within the main page.
#' @keywords style
#' @export
#' @examples
#' gov_layout()

gov_layout <- function(..., inputID = "main", size="full"){
  tags$div(id = inputID, class="govuk-width-container  govuk-main-wrapper",
    tags$div(id = paste0(inputID,"_sub"), class=paste0("govuk-grid-column-",size), ...)
  )
}
