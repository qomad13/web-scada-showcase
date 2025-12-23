## Архитектура (High-Level)

Ключевые блоки:
- TCP сервер — прием пакетов от станций, декодирование, маршрутизация по UID.
- Catalog DB — глобальная конфигурация (UID, теги, правила, проекты).
- Project DB — данные конкретного проекта (события, тренды, пользователи).
- Web API (REST) — управление конфигурациями, аутентификация.
- WebSocket — realtime события/тренды на фронтенд.
- Frontend — React + Redux/MUI, подписка по WS, работа с API.

Диаграмма (логическая):
```
Stations → TCP Server → UID Router → Alarm Processor → Project DB
                          │                    │
                          ▼                    ▼
                      Catalog DB         WebSocket Gateway → Frontend
```

Почему так:
- Изоляция данных по проектам (мультитенантность).
- Централизация конфигурации через UID (reuse настроек).
- Реалтайм через WS вместо опросов.
- TCP слой отделен от HTTP/WebSocket.

Где в коде:
- `backend/src/scada-tcp/*`
- `backend/src/project/*`
- `backend/src/realtime/*`
- `backend/src/auth/*`

