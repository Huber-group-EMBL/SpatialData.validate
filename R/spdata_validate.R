#' Validate the images/ component of a spatial data file
#' 
#' @param path Path to the spatial data file to validate
#' @poaram type SpatialData element type to be validated
#' @param s3_client An optional S3 client
#' 
#' @return `TRUE` if the spatial data file is valid, otherwise an error is thrown
#' 
#' @export
#'
#' @exampless
#' sd_zip <- system.file("extdata", "spatialdata-v0.2.zarr.zip", package = "SpatialData.validate")
#' sd <- withr::local_tempfile()
#' unzip(sd_zip, exdir = sd)
#' spdata_validate(file.path(sd, "images/blobs_multiscale_image"))
spdata_validate <- function(path, type = "image", s3_client = NULL) {
  group_attributes <- Rarr::read_zarr_attributes(path, s3_client = s3_client)
  spdata_version <- group_attributes$spatialdata_attrs$version

  # We cannot download the schemas on the fly because we patch them to use local references 
  # as jsonvalidate doesn't support remote references
  # (https://github.com/ropensci/jsonvalidate/issues/70)
  schema <- system.file(
    "extdata",
    "schemas",
    paste(type, spdata_version, sep = "-"),
    paste(type, "schema", sep = "."),
    package = "SpatialData.validate"
  )

  jsonvalidate::json_validate(
    jsonlite::toJSON(group_attributes, auto_unbox = TRUE),
    schema,
    engine = "ajv",
    error = TRUE
  )
}