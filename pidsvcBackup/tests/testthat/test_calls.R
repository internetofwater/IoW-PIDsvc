context("api call payloads")

test_that("post", {
  t_path <- tempfile()
  cat("test", file = t_path)
  call <- pidsvcBackup:::post_call(t_path, "http://root")

  expect_equal(call$api, "http://root/pidsvc/controller?cmd=import")

  expect_equal(class(call$payload$y), "form_file")
})

test_that("retire", {
  call <- pidsvcBackup:::retire_call("https://retire", "https://root")

  expect_equal(call$api, "https://root/pidsvc/controller?cmd=delete_mapping")

  expect_equal(call$payload$mapping_path, "https://retire")
})
