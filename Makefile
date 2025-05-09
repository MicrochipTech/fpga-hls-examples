REPO_OWNER := MicrochipTech
REPO_NAME := fpga-hls-examples
ASSET_NAME := lfs.zip
TAG := 2024.1

DOWNLOAD_DIR := .lfs_cache
UNZIP_DIR := lfs_extracted
ASSET_PATH := $(DOWNLOAD_DIR)/$(ASSET_NAME)

GITHUB_API_URL := https://api.github.com/repos/$(REPO_OWNER)/$(REPO_NAME)/releases/tags/$(TAG)

.PHONY: setup clean

setup:
	@echo "Downloading the release asset $(ASSET_NAME) for tag $(TAG)"
	@mkdir -p $(DOWNLOAD_DIR) || { echo "Failed to create download directory."; exit 1; }
	@curl -s $(GITHUB_API_URL) \
		| jq -r '.assets[] | select(.name == "$(ASSET_NAME)") | .browser_download_url' \
		| xargs -n 1 curl -L -o $(ASSET_PATH) || { echo "Failed to download asset $(ASSET_NAME)."; exit 1; }

	@unzip -o $(ASSET_PATH) -d $(UNZIP_DIR) || { echo "Failed to unzip $(ASSET_PATH)."; exit 1; }

	@mv $(UNZIP_DIR)/lfs/core-image-minimal-dev-sev-kit-es.wic.gz ./risc-v-demo/precompiled/linux-image/core-image-minimal-dev-sev-kit-es.wic.gz || { echo "Failed to move core-image-minimal-dev-sev-kit-es.wic.gz."; exit 1; }
	@mv $(UNZIP_DIR)/lfs/SEVPFSOC_H264.job ./risc-v-demo/precompiled/SEVPFSOC_H264.job || { echo "Failed to move SEVPFSOC_H264.job."; exit 1; }
	@mv $(UNZIP_DIR)/lfs/SinCosTable_Generator_20210112_1730.zip ./Training3/Libero/softconsole/Tools/SinCosTable_Generator_20210112_1730.zip || { echo "Failed to move SinCosTable_Generator_20210112_1730.zip."; exit 1; }

	@rm -rf $(UNZIP_DIR) $(DOWNLOAD_DIR) || { echo "Failed to clean up temporary files."; exit 1; }
	@echo "Download and extract completed successfully."

clean:
	@rm -rf $(UNZIP_DIR) $(DOWNLOAD_DIR)