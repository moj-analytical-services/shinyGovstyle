#' Footer Function
#'
#' This function create a footer
#' @keywords footer
#' @export
#' @examples
#' footer()

footer <- function(){
  tags$footer(class = "govuk-footer ",
    role = "contentinfo",
    div(class = "govuk-width-container ",
      div(class = "govuk-footer__meta",
        div(class = "govuk-footer__meta-item govuk-footer__meta-item--grow")
      )
    )
  )
}
