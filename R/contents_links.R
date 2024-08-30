
subcontents_links <- function(links_list) {

  create_sidelink <- function(link_text) {

    # match id created in heading function
    link_id <- clean_heading_text(link_text)

    shiny::tags$li("—  ", shiny::tags$a(link_text, href = paste0("#", link_id)))

  }

  shiny::tags$ol(class = "govuk-subcontents", purrr::map(links_list, create_sidelink))

}



contents_links <- function(link_text, ...) {
  clean_link_text <- clean_heading_text(link_text)

  contents_div <- shiny::tags$div(
    class = "govuk-contents",
    shiny::actionLink(
      class = "govuk-contents__link",
      inputId =   clean_link_text,
      label = link_text
    ),

    # add subcontents links if required
    ...




  )




  attachDependency(contents_div, "contents_links")




}
