#!/usr/bin/env bash

sandbox_dir="$(dirname ${BASH_SOURCE[0]})"

# check volume argument
if [ -z "$1" ]; then
    echo "volume or path missing"
    exit 1
fi

# build image
podman build -t sandbox:vibe $sandbox_dir

# ensure MISTRAL_API_KEY is set
set -a && source $sandbox_dir/.env && set +a
if [ -z "$MISTRAL_API_KEY" ]; then
    read -p "mistral api key (https://console.mistral.ai/api-keys): " MISTRAL_API_KEY
    echo $MISTRAL_API_KEY >> $sandbox_dir/.env
fi

# run container
podman run --rm -it \
  --tmpfs /tmp:size=50m \
  --memory 256m \
  --cpus 0.5 \
  --pids-limit 50 \
  --security-opt no-new-privileges \
  --cap-drop ALL \
  --user sandbox \
  --userns keep-id \
  -v "$1:/home/sandbox/code:Z" \
  -e MISTRAL_API_KEY="$MISTRAL_API_KEY" \
  sandbox:vibe

# unused flags:
#  --network none \
#  --read-only \
#  --read-only-tmpfs=false \
#  -v "$1:/home/sandbox/code:ro,Z" \
