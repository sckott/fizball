test_that("fiz", {
  vcr::use_cassette("fiz", {
    x <- fiz()
    expect_is(x, "list")
    expect_match(x$url, Sys.getenv("FIZ_KEY"))
  })
})
