#!/bin/zsh
set -e

APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR"

# Prefer a project-local virtual environment. Fall back to the existing
# PyCharm environment used by the original WeatherWise launcher, then python3.
if [[ -x "$APP_DIR/.venv/bin/python3" ]]; then
  PYTHON="$APP_DIR/.venv/bin/python3"
elif [[ -x "$HOME/PycharmProjects/pythonProject2/venv/bin/python3" ]]; then
  PYTHON="$HOME/PycharmProjects/pythonProject2/venv/bin/python3"
elif command -v python3 >/dev/null 2>&1; then
  PYTHON="$(command -v python3)"
else
  echo "Python 3 was not found."
  read -k 1 "?Press any key to close..."
  exit 1
fi

exec "$PYTHON" "$APP_DIR/weatherwise_alarm_new_ui.py"
