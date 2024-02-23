#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/.venv/bin/activate"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <SUB_PACKAGE>"
  echo "Uninstalling all since SUB_PACKAGE was not supplied"

  yes | uv pip uninstall pack.core pack.ext
  exit 0
fi

SUB_PACKAGE=$1
yes | uv pip uninstall $SUB_PACKAGE
