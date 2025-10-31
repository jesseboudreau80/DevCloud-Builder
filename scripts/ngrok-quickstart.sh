
#!/usr/bin/env bash

set -euo pipefail



echo ""

echo "🚀 PAWSitiveOps DevCloud ngrok Quickstart"

echo "-----------------------------------------"



# Check ngrok installation

if ! command -v ngrok >/dev/null 2>&1; then

  echo "ngrok not found. Install with:  sudo snap install ngrok"

  exit 1

fi



# Confirm auth

if ! grep -q "authtoken" ~/.config/ngrok/ngrok.yml 2>/dev/null; then

  echo "No ngrok auth token found. Run:"

  echo "  ngrok config add-authtoken <YOUR_TOKEN>"

  exit 1

else

  echo "✅ ngrok is authenticated."

fi



# Confirm or ask for reserved domains

echo ""

read -rp "Enter reserved domain for code-server (default: code-jesse.ngrok.dev): " CODE_HOST

CODE_HOST=${CODE_HOST:-code-jesse.ngrok.dev}



read -rp "Enter reserved domain for n8n (default: pawsitiveops.ngrok.dev): " N8N_HOST

N8N_HOST=${N8N_HOST:-pawsitiveops.ngrok.dev}



read -rp "Enter reserved domain for Syncthing (default: sync-jesse.ngrok.dev): " SYNC_HOST

SYNC_HOST=${SYNC_HOST:-sync-jesse.ngrok.dev}



# Build YAML config

mkdir -p ~/.config/ngrok

cat > ~/.config/ngrok/ngrok.yml <<YML

version: "2"

authtoken: $(grep 'authtoken:' ~/.config/ngrok/ngrok.yml | awk '{print $2}')

tunnels:

  code:

    proto: http

    addr: 8443

    hostname: ${CODE_HOST}

  n8n:

    proto: http

    addr: 5678

    hostname: ${N8N_HOST}

  syncthing:

    proto: http

    addr: 8384

    hostname: ${SYNC_HOST}

YML



echo ""

echo "✅ ngrok.yml created with three tunnels:"

echo "   - code-server:  https://${CODE_HOST}"

echo "   - n8n:          https://${N8N_HOST}"

echo "   - syncthing:    https://${SYNC_HOST}"

echo ""

echo "Starting tunnels... (Ctrl+C to stop)"

ngrok start --all

