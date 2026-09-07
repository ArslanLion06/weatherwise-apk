# Changelog

## Previously documented revision

The following changes were reported by the previous README. They have not been independently verified against runnable source during this documentation update.

- Removed hardcoded credentials from Python and the launcher.
- Fixed traffic double-counting in TomTom and Google route calculations. Traffic-adjusted journey duration was previously being counted and then the traffic delay was added again.
- Removed the fixed 30-minute Friday/Saturday/Sunday delay because live/predicted traffic data already handles journey conditions.
- Weather now shows as unavailable when the weather API is not configured or fails. It no longer substitutes made-up default conditions.
- Fixed Monday-first alignment in the calendar picker.
- Added an optional OpenAI plan explanation without making alarm calculations depend on AI availability.
- Made the launcher portable by running relative to its own folder and preferring a local `.venv`.
