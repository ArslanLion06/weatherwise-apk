# WeatherWise Alarm

A Python project for planning wake-up and departure times around an arrival deadline, journey duration, preparation time and weather.

Developed by [Arslan Yalcin](https://github.com/ArslanLion06) as part of my undergraduate Computing work and now being revisited for further development.

## Project status

**Development prototype. The current committed application cannot start as written.** During repository validation, its compressed Python payload failed to decompress. Restoring the original readable source is the first development priority. Setup below prepares the environment, but does not resolve this application error.

This is the main WeatherWise project repository. The related [weatherwiseAlarm-apk repository](https://github.com/ArslanLion06/weatherwiseAlarm-apk) currently contains no application source or release.

Despite the historical repository name, this tree provides Python files and macOS launch scripts. There is no published Android APK or Android build configuration here.

## Purpose and approach

WeatherWise explores how a decision-support application can help a user plan when to wake up and leave for a journey.

The existing project documentation describes timing calculations based on the user's arrival deadline, preparation time, journey duration, traffic delays and weather. It also describes an optional AI explanation requested through a **Get AI advice** button. Calculations are intended to remain independent of the AI response.

These describe the intended application behaviour. End-to-end verification is pending restoration of the readable source.

## Technologies

- Python and Kivy for the application and interface.
- Requests for service calls.
- OpenAI Python SDK for optional AI explanations.
- Cocoa bindings for macOS, included through a platform-specific dependency.

The dependency versions are not pinned. A tested Python version and supported operating-system matrix have not yet been recorded.

## Prepare the environment on macOS

Install Python 3 with `venv` support and Git, then open Terminal:

```bash
git clone https://github.com/ArslanLion06/weatherwise-apk.git
cd weatherwise-apk
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
cp -n .env.example .env
chmod 600 .env
open -a TextEdit .env
```

Keep an existing `.env` file rather than overwriting its values. Add credentials only for the services you intend to use.

The repository also includes `Prepare WeatherWise.command`, which creates the local environment, installs dependencies and opens the settings file. The manual instructions above show the preparation steps explicitly.

### Configuration

| Variable | Service or purpose |
|---|---|
| `TOMTOM_API_KEY` | TomTom routing and traffic |
| `OPENWEATHER_API_KEY` | Weather data |
| `GOOGLE_MAPS_API_KEY` | Google Maps routing |
| `RAIL_ACCESS_TOKEN` | Rail service token, provider setup needs documentation |
| `TRANSPORT_APP_ID`, `TRANSPORT_APP_KEY` | Transport service credentials, provider setup needs documentation |
| `OPENAI_API_KEY` | Optional AI explanations |
| `OPENAI_MODEL` | Model selection for AI explanations |

Required combinations of transport credentials and behaviour when credentials are absent still need verification. Use a model available to your API account. API services may require separate accounts and billing.

### Launch after the source is restored

```bash
.venv/bin/python3 weatherwise_alarm_new_ui.py
```

For the macOS launcher:

```bash
chmod +x "Launch WeatherWise Alarm.command"
./"Launch WeatherWise Alarm.command"
```

The launcher requires both the project-local `.venv` and `.env`. Installing packages into an unrelated Python environment will not satisfy it.

## Repository guide

| File | Purpose |
|---|---|
| `weatherwise_alarm_new_ui.py` | Current application wrapper, pending readable-source recovery |
| `weatherwise_presets.json` | Saved preset data |
| `requirements.txt` | Python dependencies |
| `.env.example` | Configuration template without credentials |
| `Prepare WeatherWise.command` | macOS environment preparation |
| `Launch WeatherWise Alarm.command` | macOS launcher |
| [CHANGELOG.md](CHANGELOG.md) | Previously documented revision changes |
| [docs/ROADMAP.md](docs/ROADMAP.md) | Development and portfolio priorities |

## Security and privacy

Keep real credentials in a private local configuration file. Do not commit `.env`, tokens or API keys. Earlier project documentation reports credentials in previous source or launchers. Any such credentials that were shared must be revoked or rotated with their providers.

The documented AI feature sends the current plan when the user requests advice. Actual payload fields and other service data flows must be checked after source recovery. Use non-personal locations in public demonstrations.

## Demonstration and validation

Screenshots and a demonstration recording are not yet included. They will be captured from the restored application using example data.

No automated tests are currently included. Priority checks are timing arithmetic, traffic-delay handling, dates crossing midnight, unavailable APIs and optional AI failure. No claim of Android compatibility or production readiness is made.

## Development context

This project connects my Computing studies with practical journey-planning problems. The next portfolio update will explain implementation decisions and individual contributions against the restored source.

## Licence

No licence has been selected for this repository. Reuse terms will be documented when a licence is chosen.
