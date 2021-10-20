test_that("test panel", {
  check_panel <- panel_output("panelId", "Main", "Second")

  expect_identical(
    check_panel$children[[1]]$children[[1]],
    "Main"
  )

  expect_identical(
    check_panel$children[[2]]$children[[1]],
    shiny::HTML("Second")
  )
})
