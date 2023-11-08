export WORKSPACE=/data/work/eoap/quickwin

command -v podman >/dev/null 2>&1 && { 
    flag="--podman"
}

cwltool ${flag} \
    --outdir ${WORKSPACE}/../runs \
    ${WORKSPACE}/cwl-cli/detect-water-body.cwl \
    --item "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2B_10TFK_20210713_0_L2A" \
    --aoi="-121.399,39.834,-120.74,40.472" \
    --epsg "EPSG:4326" \
    --band "green" \
    --band "nir" 