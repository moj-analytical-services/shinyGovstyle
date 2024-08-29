clean_heading_text <- function(text){

  text %>%
    stringr::str_replace_all(" ", "_") %>%
    stringr::str_to_lower() %>%
    stringr::str_remove_all( "[^_[a-z]]")

}
