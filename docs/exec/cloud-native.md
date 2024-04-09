### Goal

Run the `app-water-body-cloud-native.1.0.0.cwl` released application package using `cwltool`.

### Lab

This step has a dedicated lab available at `/workspace/quickwin/practice-labs/Execution-scenario.ipynb`

### Step 1 - Configure the workspace

The results produced will be available in the local folder `/workspace/quickwin/runs`

```bash linenums="1" title="terminal"
--8<--
scripts/setup.sh
--8<--
```

### Step 2 - Download the released Application package

```bash linenums="1" hl_lines="7" title="scripts/download-app-water-body-cloud-native.sh"
--8<--
scripts/download-app-water-body-cloud-native.sh
--8<--
```

### Step 3 - Execute the Application Package

```bash linenums="1" hl_lines="8" title="scripts/exec-app-water-body-cloud-native.sh"
--8<--
scripts/exec-app-water-body-cloud-native.sh
--8<--
```

### Expected outcome

The folder `/workspace/quickwin/runs` contains: 

``` hl_lines="3"
(base) jovyan@jupyter-fbrito--training:~/quickwin$ tree runs/6tt6yy9p/
runs/6tt6yy9p/
├── S2B_10TFK_20210713_0_L2A
│   ├── S2B_10TFK_20210713_0_L2A.json
│   └── otsu.tif
├── catalog.json
└── otsu.tif

1 directory, 4 files
```
