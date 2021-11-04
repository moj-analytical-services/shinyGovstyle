test_that("table works", {

    Months <- c("January", "February", "March")
    Bikes <- c("£85", "£75", "£165")
    Cars <- c("£95", "£55", "£125")

    example_data <- data.frame(Months, Bikes, Cars)

  table_check <- govTable(
    "tab1", example_data, "Test", "l", num_col = c(2,3),
    width_overwrite = c("one-half", "one-quarter", "one-quarter"))

  expect_identical(
    table_check$children[[2]]$children[[1]][[3]][[1]][[1]]$attribs$class,
    "govuk-table__header govuk-!-width-one-half"
  )

  expect_identical(
    table_check$children[[2]]$children[[1]][[3]][[1]][[2]]$attribs$class,
    "govuk-table__header govuk-table__header--numeric govuk-!-width-one-quarter"
  )

  expect_equal(
    length(table_check$children[[3]]),
    3
  )

})
