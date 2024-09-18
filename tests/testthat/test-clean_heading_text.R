test_that("clean heading text", {
  clean_heading_check <- clean_heading_text("This is my clean heading link!")

  expect_equal(
    "this_is_my_clean_heading_link",
    clean_heading_check
  )
})
