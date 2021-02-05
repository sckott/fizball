test_that("fiz", {
  vcr::use_cassette("fiz", {
    x <- fiz(b = 5)
    expect_is(x, "list")
    expect_match(x$url, Sys.getenv("FIZ_KEY"))
  })
})
