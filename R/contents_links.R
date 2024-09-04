#' Subcontents links function
#' This function is used internally within contents_links to create links to headings within pages.
#' @param subcontents_text_list vector of link text for subcontents
#' @param subcontents_id_list vector of link ids for subcontents. pass NAs for automatic matching to id in shinygovstyle::heading_text
#' @return a ol html shiny object
#' @keywords internal
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo = "shinyGovstyle/images/moj_logo.png"
#'     ),
#'     shiny::column(
#'       width = 3,
#'       id = "nav",
#'
#'      shiny::tags$div(
#'         shiny::tags$h2("Contents"),
#'         subcontents_links(
#'          c("radio_button_Input (inline)", "button_Input"),
#'          c(NA, NA)
#'         ),
#'         subcontents_links(
#'           c("date_Input", "button_Input"),
#'           c(NA, "button_input_text_types")
#'         ))))
#'
#'   server <- function(input, output, session) {
#'   }
#'   shiny::shinyApp(ui = ui, server = server)
#' }

subcontents_links <- function(subcontents_text_list,
                              subcontents_id_list) {

if (!missing(subcontents_id_list)) {
  # check if custom link_id_list is of equal length to links list
  if (length(subcontents_text_list) != length(subcontents_id_list)) {
    message(
      "`subcontents_id_list` must be equal length to `subcontents_text_list`"
    )
  }

}

  # create sidelink
  create_sidelink <- function(link_text, link_id) {
    # match id created in shinygovstyle::heading_text if custom id not specifcied
    if (is.na(link_id)) {
      link_id <- clean_heading_text(link_text)
    }

    shiny::tags$li( "\u2014 ",
                    shiny::tags$a(class = "govuk-link", link_text, href = stringr::str_c("\u0023", link_id)))
  }


  # create <li></li> tags
  list_tags <- purrr::map2(subcontents_text_list, subcontents_id_list, create_sidelink)


  # return <ol> output
  shiny::tags$ol(class = "govuk-subcontents", list_tags)

}


#' Contents link function
#'
#' This function creates an action link to nav between tabs.
#' @param link_text vector of link text for contents
#' @param input_id contents button id
#' @param subcontents_text_list vector of link text for subcontents
#' @param subcontents_id_list vector of link ids for subcontents. if missing automatically matches to id in shinygovstyle::heading_text
#' @return an action button html shiny object
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     shinyGovstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'      logo = "shinyGovstyle/images/moj_logo.png"
#'     ),
#'     shiny::column(
#'       width = 3,
#'       id = "nav",
#'
#'       shiny::tags$div(
#'         shiny::tags$h2("Contents"),
#'         contents_links(
#'           "Feedback types",
#'           "feedback_types_button",
#'           subcontents_text_list =  c("tag_Input", "details")
#'         ),
#'
#'         contents_links(
#'           "Tables, tabs and accordians",
#'           "tables_tabs_and_accordians_button",
#'           subcontents_text_list = c("govTable", "govTabs", "button_Input"),
#'           subcontents_id_list = c(NA, NA, "button_input_tables_tabs_accordians")
#'         ),
#'         contents_links("Cookies", "cookies_button")
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'   }
#'   shiny::shinyApp(ui = ui, server = server)
#' }


contents_links <- function(link_text,
                           input_id,
                           subcontents_text_list,
                           subcontents_id_list) {

  if(missing(subcontents_id_list) & !missing(subcontents_text_list)){
    subcontents_id_list <- rep(NA, length(subcontents_text_list))
  }

  contents_div <- shiny::tags$div(
    class = "govuk-contents",
    shiny::actionLink(
      onclick = "window.scrollTo(0, 0);",
      class = "govuk-contents__link govuk-link",
      inputId = input_id,
      label = link_text
    ),

    # add subcontents links if required
    if(!missing(subcontents_text_list)){
      subcontents_links(subcontents_text_list, subcontents_id_list)
    }


  )

  attachDependency(contents_div, "contents_links")

}

