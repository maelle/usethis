test_that("use_news_md() sets (development version)/'Initial submission' in new pkg", {
  create_local_package()
  mock_cran_version(NULL)

  use_news_md()

  expect_snapshot(writeLines(read_utf8(proj_path("NEWS.md"))),
                  transform = scrub_testpkg)
})

test_that("use_news_md() sets bullet to 'Added a NEWS.md file...' when on CRAN", {
  create_local_package()

  # on CRAN, local dev version
  use_description_field(name = "Version", value = "0.1.0.9000", overwrite = TRUE)
  mock_cran_version("0.1.0")

  use_news_md()

  expect_snapshot(writeLines(read_utf8(proj_path("NEWS.md"))),
                  transform = scrub_testpkg)
})

test_that("use_news_md() sets version number when 'production version'", {
  create_local_package()

  use_description_field(name = "Version", value = "0.2.0", overwrite = TRUE)
  mock_cran_version(NULL)

  use_news_md()

  expect_snapshot(writeLines(read_utf8(proj_path("NEWS.md"))),
                  transform = scrub_testpkg)
})