

<!-- README.md is generated from README.qmd. Please edit that file -->

# SpatialData.validate

<!-- badges: start -->

[![R-CMD-check](https://github.com/Huber-group-EMBL/SpatialData.validate/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Huber-group-EMBL/SpatialData.validate/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

SpatialData.validate provides schemas and a convenience function
(`spdata_validate()`) to validate SpatialData objects.

## Installation

You can install the development version of SpatialData.validate like so:

``` r
# install.packages("pak")
pak::pak("Huber-group-EMBL/SpatialData.validate")
```

## Example

``` r
library(SpatialData.validate)
spdata_validate(
  system.file("extdata", "spatialdata-v0.5", "zarr-v3", package = "SpatialData.validate")
)
#> Error:
#> ! 3 errors validating json:
#>  - /ome/omero/channels/0/label (#/$defs/omero/properties/channels/items/properties/label/type): must be string
#>  - /ome/omero/channels/1/label (#/$defs/omero/properties/channels/items/properties/label/type): must be string
#>  - /ome/omero/channels/2/label (#/$defs/omero/properties/channels/items/properties/label/type): must be string
```
