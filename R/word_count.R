#' Word Count Function
#'
#' This function create tracks the word count and should be used with the
#' text area function
#' @param inputId The input slot of the text area that you want to affect
#' @param input The text input that is associated with the box.
#' @return no value returned. Updates the word count in a shiny app
#' @keywords word count
#' @export
#' @examples
#' ui <- shiny::fluidPage(
#' shinyjs::useShinyjs(),
#' shinyGovstyle::header(
#'   "Justice", "", logo="shinyGovstyle/images/moj_logo.png"),
#' gov_layout(size = "full",
#'            text_area_Input(
#'              inputId = "text_area",
#'              label = "Can you provide more detail?",
#'              hint_label =  "Do not include personal or financial information
#'                             , like your National Insurance number or credit
#'                             card details.",
#'              word_limit = 300)
#' ),
#' footer(TRUE)
#' )
#'
#' # Define server logic required to draw a histogram
#' server <- function(input, output, session) {
#'   shiny::observeEvent(input$text_area,
#'                word_count(inputId = "text_area",
#'                           input = input$text_area,
#'                           word_limit = 300
#'                )
#'   )
#' }

word_count <- function(inputId, input){
  if (input == '') {
    word_no <- 0
  }
  else{
    word_no <-sapply(gregexpr("\\S+", input), length)
  }
  shinyjs::html(id = paste0(inputId,"wc"),
                html = paste("You have used", word_no, "of the 300 allowed"))
}



