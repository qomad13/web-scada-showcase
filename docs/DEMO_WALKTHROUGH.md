## Demo Walkthrough (5–7 минут)

Цель: показать сквозной сценарий **Station → Events/Trends → UI** без коммерческих деталей.

### 1) Поднять локальную БД
Используйте `docker-compose.example.yml`:
- `docker compose -f web-scada-showcase/docker-compose.example.yml up -d`

> В `docker-compose.example.yml` используются placeholders `CHANGE_ME` (демо‑контур).

### 2) Накатить схемы + seed
Импорт:
- `sql/schema_only/catalog_schema.sql`
- `sql/schema_only/project_schema.sql`
- `sql/seed_demo.sql`

> Seed синтетический и служит только чтобы UI/эндпойнты “ожили”.

### 3) Запустить backend
- env по шаблону: `backend/ENV_EXAMPLE.md`
- старт: `npm run start:dev`

Проверка:
- health: `/api/health`

### 4) Сценарий данных (что демонстрируем)
В демо есть:
- **один проект**: `demo-project`
- **одна станция**: `station_num = 1`
- **пара трендов**: `pressure`, `temperature`
- **одно событие**: WARNING “Demo warning event”

Смысл сценария:
- показать, что данные **пишутся** в project DB и **пушатся** на UI (WS),
- а исторические выборки идут по REST.

### 5) Быстрый технический тур (2–3 файла)
1) `backend/src/scada-tcp/packet-decoder.service.ts` — декодирование “по схеме”.
2) `backend/src/scada-tcp/alarm-processor.service.ts` + `alarm-state-tracker.service.ts` — stateful аварии.
3) `backend/src/project/connection-manager.service.ts` — выбор проектной БД по slug.

### 6) Темы для обсуждения
- Как версионировать схемы тегов/правил.
- Как избегать дубликатов событий (идемпотентность).
- Как масштабировать TCP ingest отдельно от Web/API.


