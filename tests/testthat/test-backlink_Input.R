test_that("backlink works", {
  backlink_check <- backlink_Input("backId")

  expect_identical(
    backlink_check$attribs$href,
    "#"
  )

  expect_identical(
    backlink_check$children[[1]],
    "Back"
  )

})
