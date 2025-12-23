## Security & Access

Аутентификация:
- JWT (Bearer) с временем жизни `JWT_EXPIRES_IN`.
- `jwt.strategy.ts` + `jwt-auth.guard.ts` для защиты роутов.

Авторизация:
- Роли: support/superadmin (catalog), admin/user (project).
- Superadmin bypass guard для нужных маршрутов.

Валидация/защита API:
- DTO через `ValidationPipe`, whitelist + transform.
- `helmet`, `compression`, лимиты тела (`1mb`).
- CORS включен (конфиг через env).

Безопасное хранение:
- Секреты только через env (см. `ENV_EXAMPLE.md`).
- В публичном коде — без токенов/паролей/chat_id.

