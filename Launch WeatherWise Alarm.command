#!/bin/zsh
set -e

APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR"

# Always run WeatherWise in its own project environment. This prevents an
# unrelated PyCharm virtual environment from silently supplying different
# packages or missing macOS dependencies.
PYTHON="$APP_DIR/.venv/bin/python3"

if [[ ! -x "$PYTHON" ]]; then
  echo "WeatherWise's local Python environment is not prepared yet."
  echo "Run Prepare WeatherWise.command once from this folder, then launch again."
  read -k 1 "?Press any key to close..."
  exit 1
fi

if [[ ! -f "$APP_DIR/.env" ]]; then
  echo "WeatherWise's local .env file is missing."
  echo "Run Prepare WeatherWise.command, add your private API keys, save, then launch again."
  read -k 1 "?Press any key to close..."
  exit 1
fi

exec "$PYTHON" "$APP_DIR/weatherwise_alarm_new_ui.py"
