#!/usr/bin/env bash
# Loads .env, points Python at certifi's CA bundle, and runs detect_and_grab.py.
# Usage:
#   ./run.sh              # dry run
#   ./run.sh --execute    # actually move the arm
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

set -a
source .env
set +a
export SSL_CERT_FILE=$(python3 -c "import certifi; print(certifi.where())")

python3 detect_and_grab.py "$@" 2>&1 | grep -v "^2026-"
