#' Example Function
#'
#' This function runs a shiny example using different parts of the package
#' @keywords example
#' @export
#' @examples
#' run_example()
#'
run_example <- function(){
  require(shiny)
  shinyApp(
    ui = fluidPage(
      shinyjs::useShinyjs(),
      #font(),
      shinyGovstyle::header("Justice", "Prototype", logo="shinyGovstyle/images/moj_logo.png"),
      gov_layout(size = "full",

                 backlink_Input("backid"),

                radio_button_Input(
                  inputId = "input1",
                  choices  = c("Red", "Amber", "Green"),
                  label = "Delivery RAG rating"),

                checkbox_Input(
                  inputId = "checkID",
                  cb_labels = c("Waste from animal carcasses", "Waste from mines or quarries", "Farm or agricultural waste"),
                  checkboxIds = c("op1", "op2", "op3"),
                  label = "Which types of waste do you transport?",
                  hint_label = "Select all that apply."),

                shinyGovstyle::button_Input(inputId = "btn1", label = "default"),

                shinyGovstyle::button_Input(inputId = "btn2", label = "start", type = "start"),

                shinyGovstyle::button_Input(inputId = "btn3", label = "secondary", type = "secondary"),

                shinyGovstyle::button_Input(inputId = "btn4", label = "warning", type = "warning"),

                shinyGovstyle::select_Input(
                  inputId = "sorter",
                  label = "Sort by",
                  select_text = c("Recently published", "Recently updated", "Most views", "Most comments"),
                  select_value = c("published", "updated", "view", "comments")),

                tags$br(),

                date_Input(
                  inputId = "date1",
                  label = "What is your date of birth?",
                  hint_label = "For example, 31 3 1980",
                  day = 16, month = 12, year = 1983),

                file_Input(inputId = "file1", label = "Upload a file"),

                text_Input(inputId = "txt1", label = "Event name", prefix = "boo", suffix = "Woo", error = TRUE),

                text_area_Input(
                  inputId = "text_area",
                  label = "Can you provide more detail?",
                  hint_label = "Do not include personal or financial information, like your National Insurance number or credit card details.",
                  error = TRUE),

                warning_text(inputId = "warn", text = "You can be fined up to £5,000 if you do not register."),

                insert_text(
                  inputId = "insertId",
                  text = "It can take up to 8 weeks to register a lasting power of attorney
                    if there are no mistakes in the application."),

                 details(
                   inputId = "detID",
                   label = "Help with nationality",
                   help_text = "We need to know your nationality so we can work out which elections you’re
                    entitled to vote in. If you cannot provide your nationality, you’ll have to
                    send copies of identity documents through the post."),

                 panel_output(
                   inputId = "panId",
                   main_text = "Application complete",
                   sub_text = "Your reference number <br> <strong>HDJ2123F</strong>")
              ),
    footer(TRUE)
  ),

  server = function(input, output, session) {
    err <<- FALSE
    observeEvent(input$btn1,{
      if (err) {
        err <<- FALSE
        error_off("txt1")
        error_off("text_area")
      } else {
        err <<- TRUE
        error_on("txt1", "You have an error")
        error_on("text_area", "You have an error")
      }
  })

  }
)}
