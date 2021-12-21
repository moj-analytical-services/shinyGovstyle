test_that("font stylesheet loads", {
  font_check <- font()
  expect_identical(
    font_check$stylesheet,
    "font.css"
  )
})
