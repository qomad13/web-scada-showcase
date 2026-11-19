> **English summary.** WebSCADA is a real-time SCADA web system that I designed and built. Telemetry arrives from field stations over TCP, is decoded with a per-station tag schema, passes through a stateful alarm engine, is stored in per-project MySQL databases and is pushed to the browser over WebSocket. It is multi-tenant (a catalog database plus isolated project databases) and uses UID-based configuration that is reused across projects. Stack: Node.js, TypeScript, NestJS, MySQL, WebSocket, React. Live product: [uscada.pro](https://uscada.pro).
>
> This repository is a **sanitized showcase**: architecture, data flow, ADRs, database schemas and a synthetic seed. Production code, customer data and infrastructure details are intentionally not included (see [docs/REDACTION.md](docs/REDACTION.md)). Walkthrough on a call: ledachkov.ilya@gmail.com

---

## WebSCADA — Showcase (Portfolio)

Это **санитизированная витрина** проекта WebSCADA: достаточно подробная, чтобы быстро оценить архитектуру и инженерные решения, и при этом **безопасная** (без секретов/реальных данных/прод-инфры).

### TL;DR (что это)
- **Realtime SCADA веб‑система**: прием телеметрии по TCP → обработка аварий → запись в БД → пуш на UI по WebSocket.
- **Мультитенантность**: каталог конфигурации + изолированные проектные БД.
- **UID-based конфигурация**: единая “глобальная” конфигурация типа станции переиспользуется в нескольких проектах.

### Что посмотреть за 3–5 минут
1) **Архитектура и поток данных**
   - `docs/01-architecture.md`
   - `docs/02-data-flow.md`
   - `docs/DIAGRAMS.md`
2) **Ключевые решения и компромиссы**
   - `docs/KEY_DECISIONS.md`
   - `docs/adr/` (короткие ADR)
3) **Куда смотреть в коде **
   - `backend/WHERE_TO_LOOK.md`
   - `frontend/WHERE_TO_LOOK.md`

### Что входит в витрину
- `docs/` — короткие, предметные материалы + диаграммы + ADR.
- `backend/` и `frontend/` — “карта кода” и примеры окружения.
- `sql/` — **только схемы** и **синтетический seed**.
- `docker-compose.example.yml` — локальная MySQL для демо.

### Ограничения витрины
- Прод‑инфра: IP/домены/порты/пути на серверах.
- Секреты: токены, пароли, ключи.
- Клиентские данные: реальные UUID/имена проектов/данные трендов/событий.

Подробно: `docs/REDACTION.md`.

### Локальный демо‑прогон
Это **не прод‑деплой**, а минимальный демо‑контур.

1) Поднять БД:
   - `docker compose -f web-scada-showcase/docker-compose.example.yml up -d`
2) Накатить схемы (создать БД и импортировать):
   - `web-scada-showcase/sql/schema_only/catalog_schema.sql`
   - `web-scada-showcase/sql/schema_only/project_schema.sql`
3) Накатить синтетический seed:
   - `web-scada-showcase/sql/seed_demo.sql`
4) Backend env: `web-scada-showcase/backend/ENV_EXAMPLE.md`
5) Frontend env: см. `web-scada-showcase/frontend/README.md`

Walkthrough: `docs/DEMO_WALKTHROUGH.md`.

