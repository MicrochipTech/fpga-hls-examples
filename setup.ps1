$ErrorActionPreference = "Stop"

# Variables
$REPO_OWNER = "MicrochipTech"
$REPO_NAME = "fpga-hls-examples"
$ASSET_NAME = "precompiled-binaries.zip"
$TAG = "2024.1"

$DOWNLOAD_DIR = ".precompiled-binaries_cache"
$ASSET_PATH = "$DOWNLOAD_DIR\$ASSET_NAME"

Write-Host "Downloading the release asset $ASSET_NAME for tag $TAG"
New-Item -ItemType Directory -Force -Path $DOWNLOAD_DIR | Out-Null
$GITHUB_API_URL = "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/tags/$TAG"
$Response = Invoke-RestMethod -Uri $GITHUB_API_URL
$DownloadUrl = ($Response.assets | Where-Object { $_.name -eq $ASSET_NAME }).browser_download_url
if (-not $DownloadUrl) {
    Write-Host "Failed to find asset download URL."
    exit 1
}

$ProgressPreference = 'SilentlyContinue'

curl.exe -L -o $ASSET_PATH $DownloadUrl

Write-Host "Unzipping $ASSET_PATH"
Expand-Archive -Path $ASSET_PATH -DestinationPath "." -Force

Remove-Item -Recurse -Force $DOWNLOAD_DIR

Write-Host "Download and extract completed successfully."
