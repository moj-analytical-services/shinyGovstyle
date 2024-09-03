#' Subcontents links function

#' This function creates links to headings within pages. Requires nesting in shinygovstyle::contents_links
#' @param link_text_list vector of link text for subcontents
#' @param link_id_list vector of link ids for subcontents. pass NA for automatic matching to id in shinygovstyle::heading_text
#' Defaults to NA
#' @return a ol html shiny object
#' @export
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
#'       shiny::tags$div(
#'         id = "govuk-contents-box",
#'         class = "govuk-contents-box",
#'         shiny::tags$h2("Contents"),
#'         contents_links("Select Types", "select_types_button", subcontents_links(
#'           c("radio_button_Input (inline)", "button_Input")
#'         )),
#'         contents_links("Text Types", "text_types_button", subcontents_links(
#'           c("date_Input", "button_Input"),
#'           c(NA, "button_input_text_types")
#'         ))
#'       )),
#'
#'     shiny::column(
#'       width = 9,
#'       shiny::tabsetPanel(
#'         type = "hidden",
#'         id = "tab-container",
#'         shiny::tabPanel(
#'           "Select Types",
#'           value = "select_types",
#'           gov_layout(
#'             size = "two-thirds",
#'             heading_text("Select Types", size = "l"),
#'             heading_text("radio_button_Input (inline)", size = "s"),
#'             heading_text("button_Input", size = "s"),
#'           )
#'         ),
#'         shiny::tabPanel(
#'           "Text Types",
#'           value = "text_types",
#'           gov_layout(
#'             size = "two-thirds",
#'             heading_text("Page 2", size = "l"),
#'             heading_text("date_Input", size = "s"),
#'             heading_text("button_Input", size = "s", id = "button_input_text_types"),
#'           )))))
#'
#'   server <- function(input, output, session) {
#'   }
#'   shiny::shinyApp(ui = ui, server = server)
#' }

subcontents_links <- function(link_text_list, link_id_list = NA) {

  if (!missing(link_id_list)) {
    # check if custom link_id_list is of equal length to links list
    if (length(link_text_list) != length(link_id_list)) {
      message(
        "custom`link_ids_list` arg must be of equal length to `link_ids_list` in subcontents_links()"
      )
    }

  }

  # create sidelink
  create_sidelink <- function(link_text, link_id) {
    # match id created in shinygovstyle::heading_text if custom id not specifcied
    if (is.na(link_id)) {
      link_id <- clean_heading_text(link_text)
    }

    shiny::tags$li("\u2014 ", shiny::tags$a(link_text, href = stringr::str_c("\u0023", link_id)))
  }


  # create <li></li> tags
  list_tags <- purrr::map2(link_text_list, link_id_list, create_sidelink)


  # return <ol> output
  shiny::tags$ol(class = "govuk-subcontents", list_tags)

}


#' Contents link function
#'
#' This function creates an action link to nav between tabs.
#' @param link_text vector of link text for subcontents
#' @param input_id button id
#' @param ... arg to pass shinygovstyle::subcontents_links
#' @return an action button html shiny object
#' @export
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
#'       shiny::tags$div(
#'         id = "govuk-contents-box",
#'         class = "govuk-contents-box",
#'         shiny::tags$h2("Contents"),
#'         contents_links("Select Types", "select_types_button", subcontents_links(
#'           c("radio_button_Input (inline)", "button_Input")
#'         )),
#'         contents_links("Text Types", "text_types_button", subcontents_links(
#'           c("date_Input", "button_Input"),
#'           c(NA, "button_input_text_types")
#'         ))
#'       )),
#'
#'     shiny::column(
#'       width = 9,
#'       shiny::tabsetPanel(
#'         type = "hidden",
#'         id = "tab-container",
#'         shiny::tabPanel(
#'           "Select Types",
#'           value = "select_types",
#'           gov_layout(
#'             size = "two-thirds",
#'             heading_text("Select Types", size = "l"),
#'             heading_text("radio_button_Input (inline)", size = "s"),
#'             heading_text("button_Input", size = "s"),
#'           )
#'         ),
#'         shiny::tabPanel(
#'           "Text Types",
#'           value = "text_types",
#'           gov_layout(
#'             size = "two-thirds",
#'             heading_text("Page 2", size = "l"),
#'             heading_text("date_Input", size = "s"),
#'             heading_text("button_Input", size = "s", id = "button_input_text_types"),
#'           )))))
#'
#'   server <- function(input, output, session) {
#'   }
#'   shiny::shinyApp(ui = ui, server = server)
#' }

contents_links <- function(link_text,
                           input_id,
                           ...) {

  contents_div <- shiny::tags$div(
    class = "govuk-contents",
    shiny::actionLink(
      onclick = "window.scrollTo(0, 0);",
      class = "govuk-contents__link",
      inputId = input_id,
      label = link_text
    ),

    # add subcontents links if required
    ...


  )

  attachDependency(contents_div, "contents_links")

}
