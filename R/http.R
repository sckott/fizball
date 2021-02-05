fiz_GET <- function(b = NULL, ...) {
  con <- crul::HttpClient$new(
    url = "https://httpbin.org",
    opts = list(...)
  )
  args <- c(b, list(key = Sys.getenv("FIZ_KEY")))
  res <- con$get("get", query = args)
  res$raise_for_status()
  jsonlite::fromJSON(res$parse("UTF-8"))
}
