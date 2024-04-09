### Goal

Run the command line tool in a Python virtual environment.

### Lab

This step has a dedicated lab available at `/workspace/quickwin/practice-labs/Application.ipynb`

### Step 1 - Configure the workspace

The results produced will be available in the local folder `/workspace/quickwin/runs`

```bash linenums="1" hl_lines="2-4" title="terminal"
--8<--
scripts/setup.sh
--8<--
```

### Step 2 - Create the Python virtual environment

The required Python modules are installed using `pip`:

```bash linenums="1" hl_lines="3" title="terminal"
--8<--
scripts/create_env.sh
--8<--
```


### Step 3 - Run the water bodies detection

The command line tool is invoked with:

```bash linenums="1" hl_lines="7-12" title="terminal"
--8<--
scripts/detect-water-body.sh
--8<--
```

### Step 4 - Clean-up

The Python virtual environment is no longer needed.

```bash linenums="1" title="terminal"
--8<--
scripts/deactivate.sh
--8<--
```

### Expected outcome

- [ ] The folder `/workspace/quickwin/runs` contains: 

```
(base) jovyan@coder-mrossi:~/runs$ tree .
.
├── crop_green.tif
└── crop_nir.tif

0 directories, 2 files
```