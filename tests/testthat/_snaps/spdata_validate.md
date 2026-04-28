# invalid spatial data files fail validation

    Code
      spdata_validate(system.file("extdata", "invalid", package = "SpatialData.validate"))
    Condition
      Error:
      ! 6 errors validating json:
      	- /ome/multiscales/0/datasets/0/coordinateTransformations/0/type (#/$defs/coordinateTransformations/items/oneOf/0/properties/type/enum): must be equal to one of the allowed values
      	- /ome/multiscales/0/datasets/0/coordinateTransformations/0 (#/$defs/coordinateTransformations/items/oneOf/1/required): must have required property 'translation'
      	- /ome/multiscales/0/datasets/0/coordinateTransformations/0/type (#/$defs/coordinateTransformations/items/oneOf/1/properties/type/enum): must be equal to one of the allowed values
      	- /ome/multiscales/0/datasets/0/coordinateTransformations/0 (#/$defs/coordinateTransformations/items/oneOf): must match exactly one schema in oneOf
      	- /ome/multiscales/0/datasets/0/coordinateTransformations/0/type (#/$defs/coordinateTransformations/contains/properties/type/enum): must be equal to one of the allowed values
      	- /ome/multiscales/0/datasets/0/coordinateTransformations (#/$defs/coordinateTransformations/contains): must contain at least 1 and no more than 1 valid item(s)

