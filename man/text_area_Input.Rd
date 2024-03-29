% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text_area_input.R
\name{text_area_Input}
\alias{text_area_Input}
\title{Text Area Input Function}
\usage{
text_area_Input(
  inputId,
  label,
  hint_label = NULL,
  row_no = 5,
  error = FALSE,
  error_message = NULL,
  word_limit = NULL
)
}
\arguments{
\item{inputId}{The input slot that will be used to access the value.}

\item{label}{Display label for the control, or \code{NULL} for no label.}

\item{hint_label}{Display hint label for the control, or \code{NULL} for no
hint label.}

\item{row_no}{Size of the text entry box.  Defaults to 5.}

\item{error}{Whenever to icnlud error handling  Defaults to \code{FALSE}}

\item{error_message}{Message to display on error.  Defaults to \code{NULL}}

\item{word_limit}{Add a word limit to the display.  Defaults to \code{NULL}.}
}
\value{
a text area box html shiny object
}
\description{
This function create a text area input
}
\examples{
text_area_Input("taId", "Can you provide more detail?",
"Do not include personal or financial information, like your
National Insurance number or credit card details.")
}
\keyword{area}
\keyword{text}
