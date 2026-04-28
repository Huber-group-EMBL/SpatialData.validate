test_that("valid spatial data files pass validation", {
  system.file("extdata", "spatialdata-v0.1", package = "SpatialData.validate") |>
    spdata_validate() |> 
    expect_no_condition() |> 
    expect_true()

  system.file("extdata", "spatialdata-v0.3", package = "SpatialData.validate") |>
    spdata_validate() |> 
    expect_no_condition() |> 
    expect_true()
})

test_that("invalid spatial data files fail validation", {
  system.file("extdata", "invalid", package = "SpatialData.validate") |>
    spdata_validate() |> 
    expect_snapshot(error = TRUE)
})
