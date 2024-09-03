test_that("contents_link", {
  contents_check <- contents_links("Test content link", "test_content_link")

  expect_equal(
    "test_content_link",
    contents_links("Test content link", "test_content_link")$children[[1]]$attribs$id
  )
})
