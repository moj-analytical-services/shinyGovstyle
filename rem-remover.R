#Some bits needed
con = file("inst/www/css/govuk-frontend-norem.css", "r")
base = 16
outfile = "tester.css"
detectString <- "norem"

#Loop through the file 1 line at a time.  If it has dectect string (rem/norem)
#then see if its a font-size line.  If it is ignore.  If it isn't then replace
#using the base 16 which seems to be right for this anyway.  Then write out.
#Write out all other lines as well.
while (TRUE) {
  line <- readLines(con, n = 1)
  if ( length(line) == 0 ) {
    break
  }
  if(stringr::str_detect(line, detectString) == 1){
    if (stringr::str_detect(line, "font-size") != 1){
      newValue <- stringr::str_replace(
        line,
        "\\.?\\d+\\.?\\d*",
        paste0(as.numeric(stringr::str_extract(line, "\\.?\\d+\\.?\\d*")) * base, "px")
      )
      newValue <- stringr::str_replace(newValue, detectString, "")
      write(newValue, file = outfile, append = TRUE)
    }
  } else {
    write(line, file = outfile, append = TRUE)
  }
}

close(con)
