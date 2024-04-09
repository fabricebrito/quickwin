### Goal

Wrap the CommandLineTool with a CWL Workflow

### Lab

This step has a dedicated lab available at `/workspace/quickwin/practice-labs/Workflow.ipynb`

### How to wrap a CWL CommandLineTool with a CWL Workflow

The Cloud native Workflow orchestrates the wrapped Python application command line tool as a CWL `CommandLineTool` step with input parameters:

* a SpatioTemporal Asset Catalog (STAC) Item
* a bounding box area of interest (AOI)
* the EPSG code of the bounding box area of interest
* a list of common band names (["green", "nir"])

``` mermaid
graph TB
A[STAC Item URL]
A --> B(("Detect water bodies"));
B --> C[STAC Catalog]
```

The CWL Workflow is shown below and the lines highlighted chain the water bodies detection step:

```yaml linenums="1" hl_lines="8-46" title="app-water-body-cloud-native.cwl"
--8<--
cwl-workflow/app-water-body-cloud-native.cwl
--8<--
```
