# shinyGovstyle <img src="man/figures/logo.png" align="right" height="139" style="padding-left: 1rem;" />

<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/shinyGovstyle)](https://cran.r-project.org/package=shinyGovstyle)

<!-- badges: end -->

> Apply Gov styled components and formats in shiny


## Overview

This package provides some custom widgets to style your app like gov.uk.  There are a variety of widgets available, including select, radio, checkboxes as well as styling for headers and footers.


To view details of gov.uk components please visit https://design-system.service.gov.uk/.  Most components from https://design-system.service.gov.uk/components/ are available to use through this package.



Installation :
```r
install.packages("shinyGovstyle")
```

This is also available on conda
```
conda install r-shinygovstyle
```

If you want to make use of the development then
```r
remotes::install_github("moj-analytical-services/shinyGovstyle")
```

To use error and word count elements you will need to load useShinyjs from shinyjs in the UI:
```r
  shinyjs::useShinyjs()
```


## Components available :


  - [Gov style layout](#gov-style-layout)
  - [Banner](#banner)
  - [Radio button](#radio-button)
  - [Checkbox](#checkbox)
  - [Button](#button)
  - [Select](#select)
  - [Date](#date)
  - [File input](#file-input)
  - [Text input](#text-input)
  - [Text area input](#text-area-input)
  - [Warning](#warning)
  - [Insert text](#insert-text)
  - [Details](#details)
  - [Panel](#panel)
  - [Notification Banner](#notification-banner)
  - [Accordion](#accordion)
  - [Table](#table)
  - [Tabs](#tabs)
  - [Summary List](#summary-list)
  - [Cookie Banner](#cookie-banner)
  - [Tags](#tags)
  - [Error](#error)
  - [Example Version](#example-version)

### Gov style layout

Create a gov style look to the page with a header, footer, font and layout: <br>
![gov-style-layout](man/figures/page_layout.png)

```r
ui <- fluidPage(
  #font(),
  shinyGovstyle::header("Justice", "Prototype", logo="shinyGovstyle/images/moj_logo.png"),
  gov_layout(size = "full",
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br()
      ),
  footer(TRUE)
)

server <- function(input, output, session) {}
```
Note: You can only use gov.uk font on service.gov.uk (see https://design-system.service.gov.uk/styles/typography/)

### Banner

Add a banner to the header to state in beta or alpha : <br>
![banner](man/figures/banner.png)

```r
ui <- fluidPage(
  shinyGovstyle::header("Justice", "Prototype", logo="shinyGovstyle/images/moj_logo.png"),
  banner("banner", "beta", 'This is a new service – your <a class="govuk-link" href="#">feedback</a> will help us to improve it.'),
  gov_layout(size = "full",
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br()
      ),
  footer(TRUE)
)

server <- function(input, output, session) {}
```

### Radio button

Create a gov style radio button : <br>
![radio_button](man/figures/radio_button_Input.png)

```r
radio_button_Input(inputId = "name_changed", label = "Have you changed your name?",
                   choices = c("Yes", "No"), inline = TRUE,
                   hint_label = "This includes changing your last name or spelling your name differently.")
```


### Checkbox

Turn checkboxes into gov style ones : <br>
![checkbox](man/figures/checkbox.png)

```r
checkbox_Input(
  inputId = "checkID", 
  cb_labels = c("Waste from animal carcasses", "Waste from mines or quarries", "Farm or agricultural waste"),
  checkboxIds = c("op1", "op2", "op3"),
  label = "Which types of waste do you transport?",
  hint_label = "Select all that apply.")
```

Note that you currently access the values separately through the inputIds you supply or all values through the main inputID.

### Button

Gov style button with different styles :
![button](man/figures/buttons.png)

```r
shinyGovstyle::button_Input(inputId = "btn1", label = "default"),
shinyGovstyle::button_Input(inputId = "btn1", label = "start", type = "start"),
shinyGovstyle::button_Input(inputId = "btn1", label = "secondary", type = "secondary"),
shinyGovstyle::button_Input(inputId = "btn1", label = "warning", type = "warning")
```

### Select

Gov style drop down select  :
![select](man/figures/select.png)

```r
shinyGovstyle::select_Input(
  inputId = "sorter", 
  label = "Sort by",
  select_text = c("Recently published", "Recently updated", "Most views", "Most comments"),
  select_value = c("published", "updated", "view", "comments"))
```

### Date

Gov style date input  :
![date](man/figures/date.png)

```r
date_Input(
  inputId = "date1",
  label = "What is your date of birth?",
  hint_label = "For example, 31 3 1980")
```
Note that you currently access the individual values by adding an affix of _day, _month and _year or the full date in dd/mm/yy by using the inputID.


### File input

Gov style file input component  :
![file_input](man/figures/file.png)

```r
file_Input(inputId = "file1", label = "Upload a file")
```


### Text input

Gov style text input component  :
![text_input](man/figures/text.png)

```r
text_Input(inputId = "txt1", label = "Event name")
```

### Text area input

Gov style text area input component  :
![text_area](man/figures/text_area.png)

```r
text_area_Input(
  inputId = "text_area",
  label = "Can you provide more detail?",
  hint_label = "Do not include personal or financial information, like your National Insurance number or credit card details.")
```

You can also add a word count to the options, which requires an additional argument in the server :
![text_area](man/figures/word_count.png)

```r
ui <- fluidPage(
  shinyjs::useShinyjs(),
  shinyGovstyle::header("Justice", "", logo="shinyGovstyle/images/moj_logo.png"),
  gov_layout(size = "full",
        text_area_Input(
          inputId = "text_area",
          label = "Can you provide more detail?",
          hint_label =  "Do not include personal or financial information, like 
                         your National Insurance number or credit card details.",
          word_limit = 300)
  ),
  footer(TRUE)
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  observeEvent(input$text_area,
    word_count(inputId = "text_area", input = input$text_area, word_limit = 300)
  )
}
```

### Warning

Gov style warning component  :
![text_area](man/figures/warning.png)

```r
warning_text(inputId = "warn", text = "You can be fined up to £5,000 if you do not register.")
```

### Insert text

Gov style insert text component  :
![text_area](man/figures/insert.png)

```r
insert_text(inputId = "insertId",
            text = "It can take up to 8 weeks to register a lasting power of attorney 
                    if there are no mistakes in the application.")
```


### Details

Gov style details component  :
![details](man/figures/details.png)

```r
 details(
  inputId = "detID",
  label = "Help with nationality",
  help_text = "We need to know your nationality so we can work out which elections you’re 
              entitled to vote in. If you cannot provide your nationality, you’ll have to 
              send copies of identity documents through the post.")

```

### Panel

Gov style panel component  :
![panel](man/figures/panel.png)

```r
panel_output(
  inputId = "panId", 
  main_text = "Application complete", 
  sub_text = "Your reference number <br> <strong>HDJ2123F</strong>")
```

### Notification Banner

Gov style panel component  :
![Notification Banner](man/figures/noti_banner.png)

```r
noti_banner(
  "notId",
  title_txt = "Important",
  body_txt = Example text,
  type = "standard"
)
```

### Accordion

Gov style accordion component :
![Accordion](man/figures/accordion.png)

```r
accordion(
      "acc1",
      c("Writing well for the web",
        "Writing well for specialists",
        "Know your audience",
        "How people read"
       ),
      c("This is the content for Writing well for the web.",
        "This is the content for Writing well for specialists.",
        "This is the content for Know your audience.",
        "This is the content for How people read."
       ))
```

### Table

Gov style table component :
![Table](man/figures/table.png)

```r
Months <- c("January", "February", "March")
Bikes <- c("£85", "£75", "£165")
Cars <- c("£95", "£55", "£125")
example_data <- data.frame(Months, Bikes, Cars)

shinyGovstyle::govTable(
      "tab1", example_data, "Test", "l", num_col = c(2,3),
      width_overwrite = c("one-half", "one-quarter", "one-quarter"))
```

### Tabs

Gov style tabs component :
![Tabs](man/figures/tabs.png)

```r
  # Create an example dataset
  tabs <- c(rep("Past Day", 3),
            rep("Past Week", 3),
            rep("Past Month", 3),
            rep("Past Year", 3))
  Case_manager <- rep(c("David Francis", "Paul Farmer", "Rita Patel"),4)
  Cases_open <- c(3, 1, 2, 24, 16, 24, 98, 122, 126, 1380, 1129, 1539)
  Cases_closed <- c(0, 0, 0, 18, 20, 27, 95, 131, 142, 1472, 1083, 1265)
  data <- data.frame(tabs, Case_manager, Cases_open, Cases_closed)

  ui <- fluidPage(
    shinyGovstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovstyle/images/moj_logo.png"),
    shinyGovstyle::gov_layout(size = "two-thirds",
      shinyGovstyle::govTabs("tabsID", data, "tabs")),
    shinyGovstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
```

### Summary List

Gov style summary list :
![Summary List](man/figures/summary.png)

```r
  # Create an example dataset
  headers <- c("Name", "Date of birth", "Contact information", "Contact details")
  info <- c(
    "Sarah Philips",
    "5 January 1978",
    "72 Guild Street <br> London <br> SE23 6FH",
    "07700 900457 <br> sarah.phillips@example.com")

  ui <- fluidPage(
    shinyGovstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovstyle/images/moj_logo.png"),
    shinyGovstyle::gov_layout(size = "two-thirds",
      shinyGovstyle::gov_summary("sumID", headers, info, action = TRUE)),
    shinyGovstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
```

### Cookie Banner

Gov style cookie banner :
![Cookie Banner](man/figures/cookie.png)

```r
ui <- fluidPage(
  shinyGovstyle::header(
    main_text = "Example",
    secondary_text = "User Examples",
    logo="shinyGovstyle/images/moj_logo.png"),
  #Needs shinyjs to work
  shinyjs::useShinyjs(),
  shinyGovstyle::cookieBanner("The best thing"),
  shinyGovstyle::gov_layout(size = "two-thirds"),
  shinyGovstyle::footer(full = TRUE)
)

server <- function(input, output, session) {

  #Need these set of observeEvent to create a path through the cookie banner
  observeEvent(input$cookieAccept, {
    shinyjs::show(id = "cookieAcceptDiv")
    shinyjs::hide(id = "cookieMain")
  })

  observeEvent(input$cookieReject, {
    shinyjs::show(id = "cookieRejectDiv")
    shinyjs::hide(id = "cookieMain")
  })

  observeEvent(input$hideAccept, {
    shinyjs::toggle(id = "cookieDiv")
  })

  observeEvent(input$hideReject, {
    shinyjs::toggle(id = "cookieDiv")
  })

  observeEvent(input$cookieLink, {
    #Need to link here to where further info is located.  You can
    #updateTabsetPanel to have a cookie page for instance
  })

}
shinyApp(ui = ui, server = server)
```

### Tags

Add a gov style tag component :
![tags](man/figures/tags.png)

```r
shinyGovstyle::tag_Input("tag1", "COMPLETE"),
shinyGovstyle::tag_Input("tag2", "INCOMPLETE", "red")
```

### Error

Add errors to components when not filled in correctly.  Most components have an option to add  :
![error](man/figures/error.png)

```r
ui <- fluidPage(
  shinyjs::useShinyjs(),
  shinyGovstyle::header("Justice", "", logo="shinyGovstyle/images/moj_logo.png"),
  gov_layout(size = "full",
        text_area_Input(
          "text_area",
          "Can you provide more detail?",
          "Do not include personal or financial information, like your National Insurance number or credit card details.",
          word_limit = 300, error = TRUE, error_message = "Error"),

        button_Input("btn1", "Toggle error")
  ),
  footer(TRUE)
)

server <- function(input, output, session) {
  err <<- FALSE
  observeEvent(input$btn1,{
    if (err) {
      err <<- FALSE
      error_off("text_area")
    }
    else {
      err <<- TRUE
      error_on("text_area", "You have an error")
    }
  }
  )
}
```
### Example Version

You can run an example dashboard.  This is very rough and will be improved.
![example](man/figures/example.png)

```r
run_example()
```

