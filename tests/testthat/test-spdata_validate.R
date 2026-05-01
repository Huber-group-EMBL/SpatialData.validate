formats <- c("0.1", "0.1b", "0.2")

for(fmt in formats){
  test_that("valid spatial data files pass validation", {
    
    sd_zip <- system.file("extdata", 
                          paste0(
                            "spatialdata-v", fmt, ".zarr.zip"
                          ),
                          package = "SpatialData.validate")
    sd <- withr::local_tempfile()
    unzip(sd_zip, exdir = sd)

    file.path(sd, "images/blobs_multiscale_image") |>
      spdata_validate() |> 
      expect_no_condition() |> 
      expect_true()
  }) 
}

test_that("invalid spatial data files fail validation", {
  system.file("extdata", "invalid", package = "SpatialData.validate") |>
    spdata_validate() |> 
    expect_snapshot(error = TRUE)
})
