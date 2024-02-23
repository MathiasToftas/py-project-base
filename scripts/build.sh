#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/.venv/bin/activate"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <SUB_PACKAGE>"
  echo "Building all since SUB_PACKAGE was not supplied"

  python -m build "$ROOT_DIR/pack.core"
  python -m build "$ROOT_DIR/pack.ext"

  exit 0
fi

SUB_PACKAGE=$1
python -m build "$ROOT_DIR/$SUB_PACKAGE"
