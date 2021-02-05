library("vcr") # *Required* as vcr is set up on loading

vcr_dir <- vcr::vcr_test_path("fixtures")

if (!nzchar(Sys.getenv('FIZ_KEY'))) {
  if (dir.exists(vcr_dir)) {
    Sys.setenv('FIZ_KEY'="11a1111a111a1a1a1a111111a1aa11a1")
  } else {
    stop("No API key nor cassettes, tests cannot be run.",
         call. = FALSE)
  }
}

vcr::vcr_configure(
  turned_off = FALSE,
  dir = vcr_dir,
  filter_sensitive_data = list("<<<fiz_key>>>" = Sys.getenv('FIZ_KEY'))
)
vcr::check_cassette_names()
