test_that("accordion works", {

  accordion_check <- accordion(
          "acc1",
          c("Writing well for the web",
            "Writing well for specialists",
            "Know your audience",
            "How people read"
           ),
          c("This is the content for Writing well for the web.",
            "This is the content for Writing well for specialists.",
            "This is the content for Know your audience.",
            "This is the content for How people read."
           ))

  expect_equal(length(accordion_check$children[[2]]), 4)

})
