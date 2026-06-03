#!/usr/bin/env python3
"""Download the IBM Granite embedding model from Hugging Face using uv,
and download the SmartHLS assistant executable from GitHub releases."""

import json
import os
import platform
import re
import shutil
import subprocess
import sys
import urllib.request
import zipfile
from pathlib import Path


MODEL_NAME = "ibm-granite/granite-embedding-278m-multilingual"
CACHE_DIR = Path.home() / ".claude" / "plugins" / "data" / "hf"
GITHUB_REPO = "MicrochipTech/fpga-hls-examples"
GITHUB_API_BASE = f"https://api.github.com/repos/{GITHUB_REPO}"
PLUGIN_DATA_DIR = Path.home() / ".claude" / "plugins" / "data" / "shls_coding_assistant-mchp_hls_marketplace"


# ---------------------------------------------------------------------------
# Model download helpers
# ---------------------------------------------------------------------------

def check_uv():
    result = subprocess.run(["uv", "--version"], capture_output=True, check=False)
    if result.returncode != 0:
        print("ERROR: 'uv' is not installed or not in PATH.", file=sys.stderr)
        print("Install it from https://github.com/astral-sh/uv", file=sys.stderr)
        sys.exit(1)
    print(f"Found uv: {result.stdout.decode().strip()}")


def _model_cache_dir() -> Path:
    """Return the expected snapshot_download folder for MODEL_NAME inside CACHE_DIR."""
    folder_name = "models--" + MODEL_NAME.replace("/", "--")
    return CACHE_DIR / folder_name


def model_is_cached() -> bool:
    """Return True if the model snapshot folder already exists in CACHE_DIR."""
    return _model_cache_dir().exists()


def download_model():
    print(f"Downloading model: {MODEL_NAME}")
    print("This may take several minutes depending on your internet connection...\n")

    CACHE_DIR.mkdir(parents=True, exist_ok=True)

    script = f"""
from huggingface_hub import snapshot_download
from sentence_transformers import SentenceTransformer
import os

model_name = "{MODEL_NAME}"
cache_dir = r"{CACHE_DIR}"

os.environ["HF_HOME"] = cache_dir
os.environ["TRANSFORMERS_CACHE"] = cache_dir

print(f"Downloading {{model_name}}...")
print(f"Target cache directory: {{cache_dir}}")

print("\\nDownloading model snapshot from Hugging Face...")
downloaded_path = snapshot_download(
    repo_id=model_name,
    cache_dir=cache_dir,
    resume_download=True,
    local_files_only=False,
)
print(f"Model snapshot downloaded to: {{downloaded_path}}")

print("\\nLoading model with SentenceTransformer to complete cache...")
model = SentenceTransformer(model_name, device="cpu", cache_folder=cache_dir)
print("Model loaded successfully and fully cached!")
print("\\nModel download and cache completed successfully!")
"""

    result = subprocess.run(
        [
            "uv", "run",
            "--no-project",
            "--with", "huggingface-hub",
            "--with", "sentence-transformers",
            "python", "-c", script,
        ],
        check=False,
    )

    if result.returncode != 0:
        print("\nERROR: Model download failed!", file=sys.stderr)
        sys.exit(1)

    print(f"\nModel downloaded and cached at: {CACHE_DIR}")

# ---------------------------------------------------------------------------
# SmartHLS assistant exe download helpers
# ---------------------------------------------------------------------------

def _run_shls_version() -> "subprocess.CompletedProcess[str] | None":
    """Try to run 'shls -v', using a PowerShell fallback on Windows.

    Returns the CompletedProcess result if shls was found, or None if it
    could not be located by any strategy.
    """
    strategies: list[list[str]] = [["shls", "-v"]]
    if platform.system().lower() == "windows":
        # Claude Code executes scripts via bash on Windows, so the bash PATH
        # may not include SmartHLS even when it is available in PowerShell.
        # Falling back to powershell.exe gives us the full Windows user PATH.
        strategies.append(["powershell.exe", "-Command", "shls -v"])

    for cmd in strategies:
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, check=False)
            return result
        except FileNotFoundError:
            continue

    return None


def get_shls_version() -> str:
    """Run 'shls -v' and return the version string (e.g. '2025.2')."""
    print("\nDetecting installed SmartHLS version...")

    result = _run_shls_version()

    if result is None:
        is_windows = platform.system().lower() == "windows"
        msg = "ERROR: 'shls' command not found. Make sure SmartHLS is installed and in your PATH."
        if is_windows:
            msg += (
                "\n  On Windows: SmartHLS must be on the Windows System PATH."
                "\n  Verify by running 'shls -v' in a PowerShell or Command Prompt window."
            )
        print(msg, file=sys.stderr)
        sys.exit(1)

    output = (result.stdout + result.stderr).strip()
    if result.returncode != 0 and not output:
        print(
            f"ERROR: 'shls -v' exited with code {result.returncode} and produced no output.",
            file=sys.stderr,
        )
        sys.exit(1)

    match = re.search(r"\b(\d{4}\.\d+)\b", output)
    if match:
        version = match.group(1)
        print(f"Detected SmartHLS version: {version}")
        return version

    print(
        f"ERROR: Could not parse version from 'shls -v' output:\n  {output}",
        file=sys.stderr,
    )
    sys.exit(1)


def get_os_asset_name() -> str:
    """Return the GitHub release asset filename for the current OS."""
    system = platform.system().lower()
    if system == "linux":
        return "shls_assistant_lin.zip"
    elif system == "windows":
      #  return "shls_assistant_win"
      return "shls_assistant_win.zip"
    else:
        print(
            f"ERROR: Unsupported operating system: {platform.system()}",
            file=sys.stderr,
        )
        sys.exit(1)



def get_release_asset_url(version: str, asset_name: str) -> str:
    """Query the GitHub API and return the download URL for the given asset from a pre-release."""
    print(f"\nLooking up GitHub release '{version}' for asset '{asset_name}'...")

    api_url = f"{GITHUB_API_BASE}/releases"
    req = urllib.request.Request(
        api_url,
        headers={"User-Agent": "shls-setup-script/1.0"},
    )
    try:
        with urllib.request.urlopen(req) as response:
            releases = json.loads(response.read().decode())
    except urllib.error.HTTPError as exc:
        print(
            f"ERROR: GitHub API returned HTTP {exc.code} while listing releases.\n"
            f"  URL: {api_url}\n"
            f"  Make sure you can reach https://github.com/{GITHUB_REPO}/releases",
            file=sys.stderr,
        )
        sys.exit(1)
    except Exception as exc:
        print(f"ERROR: Failed to contact GitHub API: {exc}", file=sys.stderr)
        sys.exit(1)

    release = next(
        (r for r in releases if r.get("tag_name") == version),
        None,
    )
    if release is None:
        available = [r["tag_name"] for r in releases]
        print(
            f"ERROR: No release with tag '{version}' was found on "
            f"https://github.com/{GITHUB_REPO}/releases\n"
            f"  Available releases: {available}",
            file=sys.stderr,
        )
        sys.exit(1)

    assets = release.get("assets", [])
    for asset in assets:
        if asset["name"] == asset_name:
            url = asset["browser_download_url"]
            print(f"Found asset: {asset_name} -> {url}")
            return url

    available_assets = [a["name"] for a in assets]
    print(
        f"ERROR: Asset '{asset_name}' was not found in pre-release '{version}'.\n"
        f"  Available assets: {available_assets}",
        file=sys.stderr,
    )
    sys.exit(1)


def download_file(url: str, dest: Path) -> None:
    """Download *url* to *dest*, printing a simple progress indicator."""
    print(f"\nDownloading {dest.name} ...")

    last_pct = [-1]

    def _reporthook(block_num, block_size, total_size):
        downloaded = block_num * block_size
        if total_size > 0:
            pct = min(100, downloaded * 100 // total_size)
            if pct >= last_pct[0] + 5 or pct == 100:
                bar = "#" * (pct // 5)
                print(f"\r  [{bar:<20}] {pct:3d}%", end="", flush=True)
                last_pct[0] = pct

    try:
        urllib.request.urlretrieve(url, dest, reporthook=_reporthook)
        print()  # newline after progress bar
    except Exception as exc:
        print(f"\nERROR: Download failed: {exc}", file=sys.stderr)
        sys.exit(1)

    print(f"  Saved to: {dest}")


def extract_archive(archive_path: Path, extract_dir: Path) -> None:
    """Extract a zip archive; error out if the file is not a valid zip."""
    print(f"\nExtracting {archive_path.name} ...")
    try:
        with zipfile.ZipFile(archive_path, "r") as zf:
            zf.extractall(extract_dir)
        print(f"  Extracted to: {extract_dir}")
    except zipfile.BadZipFile:
        print(
            f"ERROR: '{archive_path}' is not a valid zip archive.\n"
            f"  The downloaded asset may use a different compression format.",
            file=sys.stderr,
        )
        sys.exit(1)
    except Exception as exc:
        print(f"ERROR: Extraction failed: {exc}", file=sys.stderr)
        sys.exit(1)


def install_shls_mcp(extract_dir: Path, plugin_root: Path) -> None:
    """Move the shls-mcp folder from the extracted archive to the plugin data directory."""
    shls_mcp_src = extract_dir / "shls-mcp"

    if not shls_mcp_src.exists():
        # Search one level deep in case there is a subdirectory wrapper
        candidates = list(extract_dir.rglob("shls-mcp"))
        if candidates:
            shls_mcp_src = candidates[0]
        else:
            print(
                f"ERROR: 'shls-mcp' folder not found inside the extracted archive at {extract_dir}",
                file=sys.stderr,
            )
            sys.exit(1)

    dest = plugin_root / "shls-mcp"
    print(f"\nInstalling shls-mcp to: {dest}")

    if dest.exists():
        print(f"  Removing existing installation at {dest} ...")
        try:
            shutil.rmtree(dest)
        except Exception as exc:
            print(f"ERROR: Could not remove existing {dest}: {exc}", file=sys.stderr)
            sys.exit(1)

    try:
        shutil.move(str(shls_mcp_src), str(dest))
        print("  shls-mcp installed successfully.")
    except Exception as exc:
        print(f"ERROR: Failed to move shls-mcp to {dest}: {exc}", file=sys.stderr)
        sys.exit(1)

    if platform.system().lower() == "linux":
        executable = dest / "shls-mcp.exe"
        if not executable.exists():
            print(
                f"ERROR: Expected executable not found at '{executable}' after installation.",
                file=sys.stderr,
            )
            sys.exit(1)
        try:
            executable.chmod(executable.stat().st_mode | 0o111)
            print(f"  Made '{executable}' executable.")
        except Exception as exc:
            print(
                f"ERROR: Failed to set executable permission on '{executable}': {exc}",
                file=sys.stderr,
            )
            sys.exit(1)


def download_and_install_assistant(version: str = None):
    """Orchestrate the assistant exe download, extraction, and configuration."""
    plugin_root = PLUGIN_DATA_DIR
    plugin_root.mkdir(parents=True, exist_ok=True)
    
    version_installed = get_shls_version() 
  
    if version is not None:
        version_match = re.fullmatch(r"(\d{4}\.\d+)(\.\d+)?", version)
        if not version_match or version_match.group(1) != version_installed:
            print(
                f"ERROR: Version '{version}' is not compatible with the locally installed "
                f"SmartHLS version '{version_installed}'. "
                f"Compatible versions are {version_installed}.<patch>, where patch can be any number from the release asset.",
                file=sys.stderr,
            )
            sys.exit(1)

    if version is None:
        version = version_installed

    print(f"Plugin data directory: {plugin_root}")
    print(f"Downloading release assets for version: {version} ...")
    
    asset_name = get_os_asset_name()
    download_url = get_release_asset_url(version, asset_name)

    # Download into a temporary directory next to the plugin root
    tmp_dir = plugin_root / "_shls_assistant_tmp"
    tmp_dir.mkdir(parents=True, exist_ok=True)
    archive_path = tmp_dir / asset_name

    try:
        download_file(download_url, archive_path)
        extract_archive(archive_path, tmp_dir)

        print(f"\nRemoving downloaded archive: {archive_path}")
        try:
            archive_path.unlink()
        except Exception as exc:
            print(f"WARNING: Could not delete archive '{archive_path}': {exc}", file=sys.stderr)

        install_shls_mcp(tmp_dir, plugin_root)

    finally:
        # Clean up temp dir (best-effort)
        if tmp_dir.exists():
            try:
                shutil.rmtree(tmp_dir)
            except Exception as exc:
                print(
                    f"WARNING: Could not remove temporary directory '{tmp_dir}': {exc}",
                    file=sys.stderr,
                )


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main(version: str = None):
    print("=== SmartHLS Plugin Setup ===\n")

    # --- Step 1: embedding model ---
    print("Step 1: IBM Granite Embedding Model\n")
    if model_is_cached():
        print(f"Model '{MODEL_NAME}' is already installed at:")
        print(f"  {_model_cache_dir()}")
        print("Skipping download.")
    else:
        check_uv()
        download_model()
        print("\n========================================")
        print(f"Model downloaded successfully to: {CACHE_DIR}")
        print("========================================\n")

    # --- Step 2: assistant exe ---
    print("Step 2: Downloading SmartHLS assistant from GitHub releases...\n")
    download_and_install_assistant(version)

    print("\n========================================")
    print("SmartHLS plugin setup completed successfully!")
    print("========================================\n")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else None)
