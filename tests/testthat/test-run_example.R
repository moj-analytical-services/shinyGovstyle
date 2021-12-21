
test_that("shiny example loads", {
  shiny::testServer(
    app = run_example(), {
    expect_equal(
      session$isClosed(),
      FALSE
    )

    }
  )
})
