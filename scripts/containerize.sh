#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$ROOT_DIR/.venv/bin/activate"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <SUB_PACKAGE>"
  exit 0
fi

SUB_PACKAGE=$1
docker build -t "$SUB_PACKAGE":dev -f "$ROOT_DIR/$SUB_PACKAGE/Dockerfile" .
