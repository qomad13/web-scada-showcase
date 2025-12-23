## Where to Look (Frontend)

Если времени мало — лучше показать “как устроен UI и состояние”, а не все страницы.

### 1) Точка входа и роутинг
- `www_scada_client/src/index.js`
- `www_scada_client/src/App.js`

### 2) Auth & guarded routes
- `www_scada_client/src/components/ProtectedRoute.jsx`
- `www_scada_client/src/store/auth/*`

### 3) Data access layer
- `www_scada_client/src/api/controller.js`
  - базовая работа с API (важно: без хардкода прод‑эндпойнтов)

### 4) State management
- `www_scada_client/src/store/index.js`
- `www_scada_client/src/store/uidConfig/*`
- `www_scada_client/src/store/allcart/*`

### 5) Realtime / live data
- `www_scada_client/src/hooks/useActiveAlarms.js`
- `www_scada_client/src/hooks/useUidConfigs.js`
  - подписки/обновления и кэш

### 6) UI building blocks (пример)
- `www_scada_client/src/components/DrawerAppBar.jsx`
- `www_scada_client/src/components/DynamicCardItem.jsx`

### Что не включено в витрину
- реальные URL/домены/ключи
- скриншоты с реальными данными клиентов


