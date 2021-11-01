#' Example Function
#'
#' This function runs a shiny example using different parts of the package
#' @return a shiny app with examples in
#' @keywords example
#' @export
#' @examples
#' if (interactive()) {
#' run_example()
#'}
run_example <- function(){
  shiny::shinyApp(
    ui = shiny::fluidPage(
      title="ShinyGovstyle",
      cookieBanner("Run Example"),
      header("MOJ", "ShinyGovstyle Example",
             logo="shinyGovstyle/images/moj_logo.png", logo_height = 38),
      banner(
        "banner",
        "beta",
        'This is a new service \u002D your <a class="govuk-link" href="#">
        feedback</a> will help us to improve it.'),

      #Need this to make the error and word count work
      shinyjs::useShinyjs(),

      #Add a message to show users how to see this code
      shiny::tags$br(),
      shiny::markdown(
        "Run ```View(run_example)``` in console to see the code for this app"),

      #Set up a nav panel so everything not on single page
      shiny::navlistPanel(
        "",
        id="nav",
        widths = c(2, 10),
        well = FALSE,

        #####################Create first panel################################
        shiny::tabPanel(
          "Select Types",
          value = "panel1",
          gov_layout(
            size = "two-thirds",
            heading_text("Page 1", size = "l"),
            label_hint("label1", "These are some examples of the types of user
                   select type inputs that you can use"),
            heading_text("radio_button_Input", size = "s"),
            radio_button_Input(
              inputId = "name_changed", label = "Have you changed your name?",
              choices = c("Yes", "No"), inline = TRUE,
              hint_label = "This includes changing your last name or spelling
                            your name differently."),
            heading_text("checkbox_Input", size = "s"),
            checkbox_Input(
              inputId = "checkID",
              cb_labels = c("Waste from animal carcasses",
                            "Waste from mines or quarries",
                            "Farm or agricultural waste"),
              checkboxIds = c("op1", "op2", "op3"),
              label = "Which types of waste do you transport?",
              hint_label = "Select all that apply."),
            heading_text("select_Input", size = "s"),
            select_Input(
              inputId = "sorter",
              label = "Sort by",
              select_text = c("Recently published",
                              "Recently updated",
                              "Most views",
                              "Most comments"),
              select_value = c("published", "updated", "view", "comments")),
            heading_text("file_Input", size = "s"),
            file_Input(inputId = "file1", label = "Upload a file"),
            heading_text("button_Input", size = "s"),
            button_Input("btn1", "Go to next page")
          )
        ),


        #####################Create second panel################################
        shiny::tabPanel(
          "Text Types",
          value = "panel2",
          gov_layout(
            size = "two-thirds",
            backlink_Input("back1"),
            heading_text("Page 2", size = "l"),
            label_hint("label2", "These are some examples of the types of user
                   text inputs that you can use"),
            heading_text("date_Input", size = "s"),
            date_Input(
              inputId = "date1",
              label = "What is your date of birth?",
              hint_label = "For example, 31 3 1980"),
            heading_text("text_Input", size = "s"),
            text_Input(inputId = "txt1", label = "Event name"),
            heading_text("text_area_Input", size = "s"),
            text_area_Input(
              inputId = "text_area1",
              label = "Can you provide more detail?",
              hint_label = "Do not include personal or financial information,
          like your National Insurance number or credit card details."),
            text_area_Input(
              inputId = "text_area2",
              label = "How are you today?",
              hint_label = "Leave blank to trigger error",
              error = T,
              error_message = "Please do not leave blank",
              word_limit = 300),
            heading_text("button_Input", size = "s"),
            button_Input("btn2", "Go to next page"),
            button_Input("btn3", "Check for errors", type = "warning")
          )
        ),

        #####################Create third panel################################
        shiny::tabPanel(
          "Feedback Types",
          value = "panel3",
          gov_layout(
            size = "two-thirds",
            backlink_Input("back2"),
            heading_text("Page 3", size = "l"),
            label_hint("label3", "These are some examples of the types of user
                   feedback inputs that you can use"),
            heading_text("tag_Input", size = "s"),
            tag_Input("tag1", "NAVY"),
            tag_Input("tag2", "RED", "red"),
            tag_Input("tag3", "BLUE", "blue"),
            tag_Input("tag4", "YELLOW", "yellow"),
            shiny::tags$br(), shiny::tags$br(),
            heading_text("details", size = "s"),
            details(
              inputId = "detID",
              label = "Help with nationality",
              help_text = "We need to know your nationality so we can work out
              which elections you\u0027re entitled to vote in. If you cannot provide
              your nationality\u002C you\u0027ll have to send copies of identity
              documents through the post."),
            heading_text("insert_text", size = "s"),
            insert_text(inputId = "insertId",
                        text = "It can take up to 8 weeks to register a lasting
                        power of attorney if there are no mistakes in the
                        application."),
            heading_text("warning_text", size = "s"),
            warning_text(
              inputId = "warn",
              text = "You can be fined up to \u00A35\u002C000 if you do
              not register."),
            heading_text("panel_output", size = "s"),
            panel_output(
              inputId = "panId",
              main_text = "Application complete",
              sub_text = "Your reference number <br> <strong>HDJ2123F</strong>"),
            heading_text("noti_banner", size = "s"),
            noti_banner(
              "notId",
              title_txt = "Important",
              body_txt = "You have 7 days left to send your application.",
              type = "standard"
            )
          )
        ),

        #####################Create fourth panel################################
        shiny::tabPanel(
          "Cookies",
          value = "panel4",
          gov_layout(
            size = "two-thirds",
            heading_text("Page 3", size = "l"),
            label_hint("label3", "This an example cookie page that could be
                       expanded")
          )
        )),

      # Add a full footer
      footer(TRUE)),

  server = function(input, output, session) {
    # Nav to next tab
    shiny::observeEvent(input$btn1, {
      shiny::updateTabsetPanel(session, "nav",
                        selected = "panel2")
    })

    # Nav to next tab
    shiny::observeEvent(input$btn2, {
      shiny::updateTabsetPanel(session, "nav",
                        selected = "panel3")
    })

    shiny::observeEvent(input$back1, {
      shiny::updateTabsetPanel(session, "nav",
                               selected = "panel1")
    })

    shiny::observeEvent(input$back2, {
      shiny::updateTabsetPanel(session, "nav",
                               selected = "panel2")
    })


    # Need this to use live update the word counter
    shiny::observeEvent(
      input$text_area2,
      word_count("text_area2", input$text_area2)
    )

    # Trigger error if text_are2 is blank
    shiny::observeEvent(input$btn3, {
      if (input$text_area2 == "") {
        error_on("text_area2")
      } else {
        error_off("text_area2")
      }
    })

    ##################### Cookie Banner events ################################
    shiny::observeEvent(input$cookieAccept, {
          shinyjs::show(id = "cookieAcceptDiv")
          shinyjs::hide(id = "cookieMain")
        })

    shiny::observeEvent(input$cookieReject, {
        shinyjs::show(id = "cookieRejectDiv")
        shinyjs::hide(id = "cookieMain")
      })

    shiny::observeEvent(input$hideAccept, {
        shinyjs::toggle(id = "cookieDiv")
      })

      shiny::observeEvent(input$hideReject, {
        shinyjs::toggle(id = "cookieDiv")
      })

    shiny::observeEvent(input$cookieLink, {
        shiny::updateTabsetPanel(session, "nav",
                                 selected = "panel4")
      })

  }
)}
