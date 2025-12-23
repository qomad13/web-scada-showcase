## Where to Look (Backend)

Список 6–8 файлов, которые быстрее всего показывают архитектуру. Если времени мало — смотреть сверху вниз.

### 1) Entry point / middleware
- `backend/src/main.ts`
  - projectSlug middleware (`/p/:slug/*`)
  - security baseline: `helmet`, `compression`, `ValidationPipe`
  - single-port setup (serve SPA build)

### 2) Multitenancy (connection management)
- `backend/src/project/connection-manager.service.ts`
  - пул подключений к project DB, выбор по `projectSlug`
- `backend/src/project/project.context.ts`
  - “контекст проекта” в рамках запроса/операции

### 3) TCP ingest (core pipeline)
- `backend/src/scada-tcp/tcp-server-multitenant.service.ts`
  - прием пакетов, routing на проекты, orchestration
- `backend/src/scada-tcp/uid-router.service.ts`
  - mapping UUID → UID → projects

### 4) Decoding (schema-driven)
- `backend/src/scada-tcp/packet-decoder.service.ts`
  - readSegment + scale/precision/bit_offset
- `backend/src/scada-tcp/decoders/registry.ts`
  - расширяемая регистрация декодеров

### 5) Stateful alarms & connection monitoring
- `backend/src/scada-tcp/alarm-processor.service.ts`
- `backend/src/scada-tcp/alarm-state-tracker.service.ts`
- `backend/src/scada-tcp/connection-monitor.service.ts`

### 6) Realtime delivery
- `backend/src/realtime/realtime.gateway.ts`
- `backend/src/project/project-websocket.gateway.ts`

### 7) Auth baseline
- `backend/src/auth/jwt.strategy.ts`
- `backend/src/auth/jwt-auth.guard.ts`

### Что я специально не включаю в showcase
- любые реальные `.env` и конфиги деплоя
- любые реальные дампы данных/логов
- детали прод‑инфры (IP/домены/пути)


