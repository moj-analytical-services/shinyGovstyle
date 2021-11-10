

# This is to create a test data
# tabs <- c(rep("Past Day", 3), rep("Past Week", 3), rep("Past Month", 3), rep("Past Year", 3))
# Case_manager <- rep(c("David Francis", "Paul Farmer", "Rita Patel"),4)
# Cases_open <- c(3, 1, 2, 24, 16, 24, 98, 122, 126, 1380, 1129, 1539)
# Cases_closed <- c(0, 0, 0, 18, 20, 27, 95, 131, 142, 1472, 1083, 1265)
#
# data <- data.frame(tabs, Case_manager, Cases_open, Cases_closed)
#
# test <- tester(data, "tabs")

govTabs <- function(df, group_col) {

  tabs <- unique(df[[group_col]])
  tab_headers <- create_tabs(tabby)

  #Select the first tab as the base
  tab_headers$children[[1]][[1]]$attribs$class <-
    "govuk-tabs__list-item govuk-tabs__list-item--selected"

  main_temp_hold <- NULL
  #This needs to make up the tables on each tab
  for(i in tabs) {
    #filter through tabs and drop the grouping value
    temp_table <- df[df[[group_col]] == i,]
    temp_table[group_col] <- NULL
    print(temp_table)
    #Create row by row the main bulk of table to insert later
    main_row_store <- NULL
    for(j in 1:nrow(temp_table)) {
      temp_row_store <- create_tab_row(temp_table[j,])
      main_row_store <- shiny::tagList(temp_row_store, main_row_store)
    }

    temp_hold <- create_tab_table(temp_table, main_row_store, i)
    main_temp_hold <- shiny::tagList(main_temp_hold, temp_hold)

  }

  #Put the lime with coconut and create the final thing
  main_tab_div <- shiny::tags$div(class = "js-enabled",
    shiny::tags$h2(class = "govuk-tabs__title", "Contents"),
    tab_headers,
    main_temp_hold)

  return(main_tab_div)

}


create_tab_table <- function(df, rows, tab){
  shiny::tags$div(
    class = "govuk-tabs__panel", id = tolower(gsub(" ", "-", tab)),
    shiny::tags$h2(class = "govuk-heading-l", tab),
    shiny::tags$table(
      class = "govuk-table",
      shiny::tags$thead(
        class = "govuk-table__head",
        shiny::tags$tr(
          class = "govuk-table__row",
          Map(function(x){
            shiny::tags$th(
              scope = "col",
              class = "govuk-table__header",
              x
            )
          }, x = colnames(df))
        )
      ),
      shiny::tags$tbody(
        class = "govuk-table__body",
        rows
      )
    )
  )
}

create_tab_row <- function(df_row){

  rowHTML <- shiny::tags$tr(
    class = "govuk-table__row",
    Map(function(x) {
      shiny::tags$td(class = "govuk-table__cell", x)
    }, x = df_row)
  )
}

create_tabs <- function(tabs_names) {
  shiny::tags$ul(
    class = "govuk-tabs__list",
    Map(function(x) {
      shiny::tags$li(
        class = "govuk-tabs__list-item",
        shiny::tags$a(
          class = "govuk-tabs__tab",
          href=paste0("#", tolower(gsub(" ", "-", x))),
          x)
      )
    }, x = tabs_names)

  )
}
