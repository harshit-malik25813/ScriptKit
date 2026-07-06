#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${ARTIFACT_PATH:-}" ]]; then
  echo "ARTIFACT_PATH is required" >&2
  exit 1
fi

if [[ -z "${RELEASE_TAG:-}" ]]; then
  echo "RELEASE_TAG is required" >&2
  exit 1
fi

asset_suffix="${PUBLISH_ARG_ASSET_SUFFIX:-}"
if [[ -z "${asset_suffix}" ]]; then
  echo "PUBLISH_ARG_ASSET_SUFFIX is required" >&2
  exit 1
fi

stage_dir="dist/release-assets/${RELEASE_TAG}"
asset_name="ScriptKit-${RELEASE_TAG}-${asset_suffix}"
mkdir -p "${stage_dir}"
cp "${ARTIFACT_PATH}" "${stage_dir}/${asset_name}"

printf '%s\n' "${stage_dir}/${asset_name}"