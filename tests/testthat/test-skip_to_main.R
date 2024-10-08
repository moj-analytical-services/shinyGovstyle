test_that("test skip_to_main_href", {
  expect_equal(skip_to_main()$attribs$href, "#main_col")
})
