test_that("test default footer", {

  footer_check <- footer()

  expect_identical(
    footer_check$attribs$class,
    "govuk-footer "
  )

})

test_that("test default footer", {

  footer_check <- footer(TRUE)

  expect_identical(
    footer_check$attribs$class,
    "govuk-footer "
  )

})
