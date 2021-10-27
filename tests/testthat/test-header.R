test_that("multiplication works", {
  header_check <- header("Test", "Again")

  expect_identical(
    header_check$children[[2]]$attribs$class,
    "govuk-header__container govuk-width-container"
  )
})
