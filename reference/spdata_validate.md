# Validate the images/ component of a spatial data file

Validate the images/ component of a spatial data file

## Usage

``` r
spdata_validate(path, s3_client = NULL)
```

## Arguments

- path:

  Path to the spatial data file to validate

- s3_client:

  An optional S3 client

## Value

`TRUE` if the spatial data file is valid, otherwise an error is thrown

## Examples

``` r
spdata_validate(
  system.file("extdata", "spatialdata-v0.5", "zarr-v3", package = "SpatialData.validate")
)
#> Error in read_schema(schema, v8): Schema '' looks like a filename but does not exist
```
