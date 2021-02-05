fiz_GET <- function(...) {
  con <- crul::HttpClient$new(
    url = "https://httpbin.org"
    # opts = list(...)
  )
  res <- con$get("get", query = list(key = Sys.getenv("FIZ_KEY")))
  res$raise_for_status()
  jsonlite::fromJSON(res$parse("UTF-8"))
}
