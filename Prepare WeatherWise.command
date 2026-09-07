#!/bin/zsh
set -e
APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR"

if [[ ! -f .env ]]; then
  cp .env.example .env
  chmod 600 .env
  echo "Created private .env file."
else
  echo ".env already exists, leaving it unchanged."
fi

if [[ ! -d .venv ]]; then
  python3 -m venv .venv
fi

source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

open -a TextEdit .env || true

echo ""
echo "Setup finished. Add your private keys to .env, save it, then double-click Launch WeatherWise Alarm.command."
read -k 1 "?Press any key to close..."
