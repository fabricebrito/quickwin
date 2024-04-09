version="1.0.0"

export WORKSPACE=/workspace/quickwin

wget \
    -O ${WORKSPACE}/runs/app-water-body-cloud-native.${version}.cwl \
    https://github.com/eoap/quickwin/releases/download/${version}/app-water-body-cloud-native.${version}.cwl