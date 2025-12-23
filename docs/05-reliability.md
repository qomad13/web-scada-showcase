## Reliability & Observability

Устойчивость:
- TCP server стартует вместе с Nest, оборачивается try/catch.
- Graceful startup: логирование статуса, fallbacks.
- Alarm state tracker — сохраняет состояние, избегает флаппинга.
- Connection monitor — события потери/восстановления связи.

Наблюдаемость:
- Структурированные логи (Nest Logger).
- Health endpoints (`/api/health`).
- Размеры тела ограничены (1mb); можно добавить rate limiting (env/мидлварь).

Паттерны:
- Ретраи/идемпотентность в обработке событий.
- Дедуп событий по станции/коду.
- Разделение путей данных: TCP ingest vs HTTP API vs WebSocket.

