#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/.venv/bin/activate"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <SUB_PACKAGE>"
  echo "Installing all since SUB_PACKAGE was not supplied"

  uv pip install --editable "$ROOT_DIR/pack.core" --editable "$ROOT_DIR/pack.ext" --config-settings editable_mode=strict

  exit 0
fi

SUB_PACKAGE=$1
uv pip install --editable "$ROOT_DIR/$SUB_PACKAGE"
