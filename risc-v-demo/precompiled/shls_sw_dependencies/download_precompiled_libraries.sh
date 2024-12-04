SHLS_ROOT_DIR=$(dirname "$(dirname "$(which shls)")")
echo $SHLS_ROOT_DIR

rsync -av --exclude='*.tar.gz' $SHLS_ROOT_DIR/smarthls-library/external/vision/precompiled_sw_libraries/* ./
