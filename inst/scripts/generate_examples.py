# /// script
# requires-python = "==3.13.0"
# dependencies = [
#   "spatialdata==0.7.2",
#   "ome-zarr==0.13.0"
# ]
# ///
import os
import shutil
import zipfile

import spatialdata as sd
from spatialdata._io.format import (
  RasterFormatV01,
  RasterFormatV02,
  RasterFormatV03,
  ShapesFormatV01,
  ShapesFormatV02,
  ShapesFormatV03,
  PointsFormatV01,
  PointsFormatV02,
  TablesFormatV01,
  TablesFormatV02,
  SpatialDataContainerFormatV01,
  SpatialDataContainerFormatV02
)

versions = {
    "0.1": [RasterFormatV01(), ShapesFormatV01(), PointsFormatV01(), TablesFormatV01(), SpatialDataContainerFormatV01()],
    "0.1b": [RasterFormatV02(), ShapesFormatV02(), PointsFormatV01(), TablesFormatV01(), SpatialDataContainerFormatV01()],
    "0.2": [RasterFormatV03(), ShapesFormatV03(), PointsFormatV02(), TablesFormatV02(), SpatialDataContainerFormatV02()],
}

blbs = sd.datasets.blobs()
for v, fmt in versions.items():
    print(v)
    path = f"../extdata/spatialdata-v{v}.zarr"
    
    if os.path.exists(path) and os.path.isdir(path):
        shutil.rmtree(path)
        
    blbs.write(path, sdata_formats = fmt)
    
    # zip files
    zip_path = f"{path}.zip"
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as z:
        for root, dirs, files in os.walk(path):
            dirs.sort()
            files.sort()
            for file in files:
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, path)
                z.write(full_path, arcname=rel_path)
                
    shutil.rmtree(path)
