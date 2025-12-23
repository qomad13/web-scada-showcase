## Backend (Showcase)

Что показать в публичной витрине, не раскрывая чувствительное:

### Ключевые файлы/модули (можно включать)
- `src/main.ts` — глобальные middleware, SPA static serve, projectSlug middleware.
- `src/project/connection-manager.service.ts` — мультитенантные подключения к БД.
- `src/project/project.context.ts` — контекст проекта.
- `src/scada-tcp/uid-router.service.ts` — маршрутизация UID.
- `src/scada-tcp/packet-decoder.service.ts` — декодирование пакетов по схеме.
- `src/scada-tcp/alarm-processor.service.ts` — обработка аварий.
- `src/scada-tcp/alarm-state-tracker.service.ts` — state tracking аварий.
- `src/scada-tcp/connection-monitor.service.ts` — мониторинг соединений.
- `src/realtime/realtime.gateway.ts` и `src/project/project-websocket.gateway.ts` — WebSocket.
- `src/auth/jwt.strategy.ts`, `jwt-auth.guard.ts`, `superadmin-bypass.guard.ts` — аутентификация/авторизация.

### Что не включать
- Реальные `.env` и любые секреты.
- Реальные IP/домены/порты прод-среды.
- Логи, дампы, временные файлы.

### Настройка окружения
Использовать только пример:

```
PORT=3000
TCP_PORT=48648
DB_HOST=localhost
DB_PORT=3306
DB_USER=scada_user
DB_PASSWORD=CHANGE_ME
DB_NAME=scada
JWT_SECRET=CHANGE_ME
JWT_EXPIRES_IN=1h
LOG_LEVEL=info
ENABLE_DEFAULT_SEED=false
```

> В публичной витрине используются placeholders `CHANGE_ME`.

### Минимальный запуск (локально, демо)
1) Запустить MySQL (docker-compose.example.yml) с пользователем/паролем из `.env.example`.
2) Накатить схемы из `../sql/schema_only/` и синтетический seed `../sql/seed_demo.sql`.
3) `npm install && npm run build && npm run start:dev`.

### Примечания
- Порты/IP только через env; не хардкодить в коде и документации.
- Если нужны примеры payload — использовать синтетические демо-значения.

Быстрый “куда смотреть”:
- `WHERE_TO_LOOK.md`

