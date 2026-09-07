# WeatherWise Alarm, secured revision

WeatherWise calculates a wake-up and leave-by time from the required arrival time, journey duration, delays, preparation time and weather. This revision keeps those calculations deterministic and adds an optional OpenAI explanation layer.

## Security changes

Real API credentials have been removed from the Python source and launcher. WeatherWise now reads credentials from operating-system environment variables or a local `.env` file. `.env` is excluded by `.gitignore`.

The credentials found in the previous source and launcher should be treated as exposed if those files were ever committed, shared, backed up publicly or pushed to GitHub. Revoke or rotate them with the relevant providers before reusing the project.

## First setup on macOS

1. Put this whole folder somewhere permanent, for example `~/Desktop/WeatherWise`.
2. In Terminal, open the folder and create the private settings file:

   `cp .env.example .env`

3. Restrict the file permissions:

   `chmod 600 .env`

4. Open `.env` in a text editor and add the new/reissued credentials for the services you use. Put your OpenAI key next to `OPENAI_API_KEY=`. Do not send that key in chat or commit it to GitHub.
5. Install dependencies into the Python environment used by WeatherWise:

   `python3 -m pip install -r requirements.txt`

   If you prefer a project-local environment:

   `python3 -m venv .venv`

   `source .venv/bin/activate`

   `python -m pip install -r requirements.txt`

6. Double-click `Launch WeatherWise Alarm.command`.

## OpenAI feature

The OpenAI call is manual. WeatherWise sends the current calculated plan only when **Get AI advice** is pressed. The AI is instructed to explain the existing plan, not replace or invent journey calculations. The default model is `gpt-5.6-luna`, which can be changed through `OPENAI_MODEL` in `.env`.

## Correctness fixes in this revision

- Removed hardcoded credentials from Python and the launcher.
- Fixed traffic double-counting in TomTom and Google route calculations. Traffic-adjusted journey duration was previously being counted and then the traffic delay was added again.
- Removed the fixed 30-minute Friday/Saturday/Sunday delay because live/predicted traffic data already handles journey conditions.
- Weather now shows as unavailable when the weather API is not configured or fails. It no longer substitutes made-up default conditions.
- Fixed Monday-first alignment in the calendar picker.
- Added an optional OpenAI plan explanation without making alarm calculations depend on AI availability.
- Made the launcher portable by running relative to its own folder and preferring a local `.venv`.

## GitHub rule

Before committing, run:

`git status`

Make sure `.env` is not listed. Only `.env.example` should be committed.
