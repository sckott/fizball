library("vcr") # *Required* as vcr is set up on loading
invisible(vcr::vcr_configure(
  dir = vcr::vcr_test_path("fixtures"),
  filter_sensitive_data = list("<<<fiz_key>>>" = Sys.getenv('FIZ_KEY'))
))
vcr::check_cassette_names()
