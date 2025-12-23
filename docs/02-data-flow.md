## Поток данных (Packet → UI)

1) **Station → TCP**: пакет с UUID и телеметрией.  
2) **UID Router**: находит UID, связанные проекты.  
3) **Decoder**: применяет схему тегов (offset/len/scale).  
4) **Alarm Processor**: проверяет правила, открывает/закрывает события.  
5) **Persistence**: пишет тренды/события в Project DB.  
6) **Realtime**: пушит обновления через WebSocket.  
7) **Frontend**: подписка по WS + выборка исторических данных через REST.

Ключевые точки расширения:
- Реестр декодеров (`scada-tcp/decoders/registry.ts`).
- Правила аварий (правила в каталоге, логика в `alarm-processor.service.ts`).
- Подписки WS (room per project/uid/user).

Идемпотентность/устойчивость:
- Дедуп по событию/станции.
- Отслеживание состояния аварий (state tracker).
- Поддержка reconnection и повторной доставки WS.

