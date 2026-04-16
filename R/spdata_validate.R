#' @examples
#' spdata_validate(
#'   system.file("extdata", "spatialdata-v0.5", "zarr-v3", package = "SpatialData.validate")
#' )
spdata_validate <- function(path, s3_client = NULL) {
  group_attributes <- Rarr::read_zarr_attributes(path, s3_client = s3_client)
  spdata_version <- group_attributes$spatialdata_attrs$version

  # We cannot download the schemas on the fly because we patch them to use local references 
  # as jsonvalidate doesn't support remote references
  # (https://github.com/ropensci/jsonvalidate/issues/70)
  schema <- system.file(
    "extdata",
    "schemas",
    spdata_version,
    "image.schema",
    package = "SpatialData.validate"
  )

  jsonvalidate::json_validate(
    jsonlite::toJSON(group_attributes, auto_unbox = TRUE),
    schema,
    engine = "ajv",
    error = TRUE
  )
}