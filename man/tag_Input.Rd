% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tag.R
\name{tag_Input}
\alias{tag_Input}
\title{Tag Function}
\usage{
tag_Input(inputId, text, colour = "navy")
}
\arguments{
\item{inputId}{The id to access the tag}

\item{text}{The text in the tag}

\item{colour}{The colour of the tag.  Default is navy.  Other options are
grey, green, turquoise, blue, purple, pink, red, orange and yellow}
}
\value{
a tag html shiny object.
}
\description{
This function creates a tag
}
\examples{
if (interactive()) {
  ui <- fluidPage(
    shinyGovstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovstyle/images/moj_logo.png"),
    shinyGovstyle::gov_layout(size = "two-thirds",
      shinyGovstyle::tag_Input("tag1", "Complete"),
      shinyGovstyle::tag_Input("tag2", "Incomplete", "red")),
    shinyGovstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
}
\keyword{tag}
