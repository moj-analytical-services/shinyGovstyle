# shinyGovstyle


> Apply Gov styled components and formats in shiny


## Overview

This package provide some custom widgets to style your app like gov.uk.  There are a varity of widgets available, inlcuding select, radio, checkboxes as well as styling for headers and footers.


Top view details of gov.uk comnponents please visit https://design-system.service.gov.uk/.  Most components from https://design-system.service.gov.uk/components/ are available to use through this package.



Installation :
```r
# install.packages("devtools")
devtools::install_github("moj-analytical-services/shinyGovstyle")
```

To use error and word count elements you will need to load useShinyjs from shinyjs in the ui:
```r
  shinyjs::useShinyjs()
```


## Components available :


  - [Gov style layout](#gov-style-layout)
  - [Radio button](#radio-button)
  - [Checkbox](#checkbox)
  - [Button](#button)
  - [Select](#select)
  - [Date](#date)
  - [File input](#file-input)
  - [Text input](#text-input)
  - [Text area input](#text-area-input)
  - [warning](#warning)
  - [Insert text](#insert-text)
  - [details](#details)
  - [panel](#panel)
  - [error](#error)

### Gov style layout

Create a gov style look to the page with a header and footer : <br>
![gov-style-layout](man/figures/page_layout.png)


```r
ui <- fluidPage(
  shinyGovstyle::header("Justice", "Prototype", logo="shinyGovstyle/images/moj_logo.png"),

  fluidRow(
    tags$div(id = "main_page", class="govuk-width-container  govuk-main-wrapper",
      tags$div(id = "login_div", class="govuk-grid-column-full",
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br(),
        tags$br(),
      )
    )
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
checkbox_input(c("Waste from animal carcasses", "Waste from mines or quarries", "Farm or agricultural waste"),
               c("op1", "op2", "op3"),
               "Which types of waste do you transport?",
               "Select all that apply.")
```

Note that you currently access the values seperately through the inputIds you supply.

### Button

Gov style button with different styles :
![button](man/figures/buttons.png)

```r
shinyGovstyle::button_Input("btn1", "default"),
shinyGovstyle::button_Input("btn1", "start", "start"),
shinyGovstyle::button_Input("btn1", "secondary", "secondary"),
shinyGovstyle::button_Input("btn1", "warning", "warning")
```

### Select

Gov style dropdown select  :
![select](man/figures/select.png)

```r
shinyGovstyle::select_Input("sorter",
                            "Sort by",
                            c("Recently published", "Recently updated", "Most views", "Most comments"),
                            c("published", "updated", "view", "comments"))
```

### Date

Gov style date input  :
![date](man/figures/date.png)

```r
select_Input("sorter",
             "Sort by",
             c("Recently published", "Recently updated", "Most views", "Most comments"),
             c("published", "updated", "view", "comments"))
```
Note that you currently access the values by adding a affix of _day, _month and _year to access the values.


### File input

Gov style file input component  :
![file_input](man/figures/file.png)

```r
file_Input("file1", "Upload a file")
```


### Text input

Gov style text input component  :
![text_input](man/figures/text.png)

```r
file_Input("file1", "Upload a file")
```

### Text area input

Gov style text area input component  :
![text_area](man/figures/text_area.png)

```r
text_area_Input(
  "text_area",
  "Can you provide more detail?",
  "Do not include personal or financial information, like your National Insurance number or credit card details.",
  word_limit = 300)
```

You can also add a word count to the options, which requires an addition arguement in the server :
![text_area](man/figures/word_count.png)

```r
ui <- fluidPage(
  shinyjs::useShinyjs(),
  shinyGovstyle::header("Justice", "", logo="shinyGovstyle/images/moj_logo.png"),

  fluidRow(
    tags$div(id = "main_page", class="govuk-width-container  govuk-main-wrapper",
      tags$div(id = "login_div", class="govuk-grid-column-full",
        text_area_Input(
          "text_area",
          "Can you provide more detail?",
          "Do not include personal or financial information, like your National Insurance number or credit card details.",
          word_limit = 300),
      )
    )
  ),
  footer(TRUE)
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  observeEvent(input$text_area,
    word_count("text_area", input$text_area)
  )
}
```

### Warning

Gov style warning component  :
![text_area](man/figures/warning.png)

```r
warning_text("warn", "You can be fined up to £5,000 if you do not register.")
```

### Insert text

Gov style insert text component  :
![text_area](man/figures/insert.png)

```r
insert_text("insertId",
            "It can take up to 8 weeks to register a lasting power of attorney if there are no mistakes in the application.")
```


### Details

Gov style details component  :
![details](man/figures/details.png)

```r
 details("detID",
         "Help with nationality",
         "We need to know your nationality so we can work out which elections you’re entitled to vote in. If you cannot provide your nationality, you’ll have to send copies of identity documents through the post.")

```

### Panel

Gov style panel component  :
![panel](man/figures/panel.png)

```r
panel_output("panId", "Application complete", "Your reference number <br> <strong>HDJ2123F</strong>")
```

### Error

Add errors to copmponents when not filled in correctly.  Most components have an option to add  :
![error](man/figures/error.png)

```r
ui <- fluidPage(
  shinyjs::useShinyjs(),
  shinyGovstyle::header("Justice", "", logo="shinyGovstyle/images/moj_logo.png"),

  fluidRow(
    tags$div(id = "main_page", class="govuk-width-container  govuk-main-wrapper",
      tags$div(id = "login_div", class="govuk-grid-column-full",

        text_area_Input(
          "text_area",
          "Can you provide more detail?",
          "Do not include personal or financial information, like your National Insurance number or credit card details.",
          word_limit = 300, error = TRUE, error_message = "Error"),

        button_Input("btn1", "Toggle error")

      )
    )
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



And others !
