### Step purpose 

Purpose: to detect water bodies using the Otsu threshold on the NDWI index from a satellite image acquired by Sentinel-2. 

This step is highlighted below:

``` mermaid
graph TB
subgraph Process STAC item
  A[STAC Item] -- STAC Item URL --> B
  A[STAC Item] -- STAC Item URL --> C
  A[STAC Item] -- STAC Item URL --> F
subgraph loop on bands
  B["crop(green)"];
  C["crop(nir)"];
end
  B["crop(green)"] -- crop_green.tif --> D[Normalized difference];
  C["crop(nir)"] -- crop_nir.tif --> D[Normalized difference];
  D -- norm_diff.tif --> E[Otsu threshold]
end
  E -- otsu.tif --> F[Create STAC Catalog]
  F -- "catalog.json/item.json/asset otsu.tif" --> G[(storage)]
```

### Code

The `app.py` script is a command-line tool that takes as input

* a SpatioTemporal Asset Catalog (STAC) Item
* a bounding box area of interest (AOI)
* an EPSG code
* a common band names as input

and then:

- reads the STAC Item
- loops on the common band names to crop the specified band from the asset associated with the common band name to the specified AOI. 
- performs a normalized difference between two cropped raster images
- applies the Otsu threshold to a single input raster image
- takes the STAC Item URL and corresponding water body GeoTIFF to create a STAC Item, and organizes it into a STAC Catalog

It uses various Python libraries like `pystac`, `rasterio`, `pyproj`, `shapely`, and `loguru`.

Here is an overview of the script's functionality:

* `aoi2box` Function: Converts an Area of Interest (AOI) expressed as a string representation of a bounding box into a list of floating-point numbers, making it compatible with geospatial operations.

* `get_asset` Function: Retrieves a specific asset from a STAC Item using a common band name. It iterates through the STAC Item's assets to find a match based on the common name associated with a band, ensuring the relevant geospatial data is selected for processing.

* `crop` Function: Acts as the script's core operation, initiating the process by reading the specified STAC Item from the input URL. It locates and processes the asset corresponding to the given common band name(s), applying geospatial operations to crop this asset to the designated AOI. The cropping operation is facilitated by rasterio and involves several key steps:

  * Coordinate transformation is performed to align the AOI with the asset's coordinate reference system (CRS), based on the provided EPSG code.
  * The rasterio.mask.mask function is used to crop the asset using the transformed bounding box, effectively isolating the area of interest from the larger dataset.

*  The cropped image data is then written to a new GeoTIFF file, following a naming convention like "crop_bandname.tif," making it straightforward to identify the output related to specific bands.

After cropping, the script  implements functionality for image processing including:

* Calculating the normalized difference index (NDI) using the normalized_difference function, a common technique in remote sensing for extracting specific features from multi-band imagery, such as vegetation index or water index, depending on the bands selected.

* Applying Otsu's method for thresholding using the threshold function, which can be used for binary classification of the image data, such as distinguishing water bodies from other land covers.

* STAC Catalog Creation: In its concluding steps, the script generates a new STAC Catalog to include the processed imagery. This involves creating a catalog entry for the output data, ensuring that the geospatial data's metadata is properly organized and accessible for further use, sharing, or integration with other geospatial data systems.

The script has a command-Line Interface that uses `click` to create a user-friendly command-line interface. It allows users to input the application parameters such as the STAC Item URL, the AOI, the EPSG code for coordinate reference, and the common band name(s) for the imagery data of interest. 

The script usage is:

```
Usage: app.py [OPTIONS]

  Detects water bodies using the Normalized Difference Water Index (NDWI) and
  Otsu thresholding.

Options:
  --input-item TEXT  STAC Item URL or staged STAC catalog  [required]
  --aoi TEXT         Area of interest expressed as a bounding box  [required]
  --epsg TEXT        EPSG code  [required]
  --band TEXT        Common band name  [required]
  --help             Show this message and exit.
```

To use this script, you would typically run it from the command line, providing the necessary input options such as the STAC Item URL, AOI, EPSG code, and common band name: 

```
python app.py \
  --input-item "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2B_10TFK_20210713_0_L2A" \
  --aoi "-121.399,39.834,-120.74,40.472" \
  --epsg "EPSG:4326" \
  --band "green" 
```

It will then crop the specified band from the STAC asset and save it as a GeoTIFF file.

The Python code is provided here:

```python linenums="1" title="water-bodies/command-line-tools/detect-water-body/app.py"
--8<--
water-bodies/command-line-tools/detect-water-body/app.py
--8<--
```
