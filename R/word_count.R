#' Word Count Function
#'
#' This function create tracks the word count and should be used with the text area function
#' @param inputId The input slot of the text area that you want to affect
#' @keywords word count
#' @export
#' @examples
#' word_count("inputID")
#'
word_count <- function(inputId,input){
  if (input == '') {
    word_no <- 0
  }
  else{
    word_no <-sapply(gregexpr("\\S+", input), length)
  }
  shinyjs::html(id = paste0(inputId,"wc"), html = paste("You have used", word_no, "of the 300 allowed"))
}



