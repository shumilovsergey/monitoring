## Вступление

MySQL Exporter нужен для:
- сбора метрик MySQL/MariaDB сервера
- мониторинга производительности БД
- отслеживания connections, queries, replication

## Метрики

Основные группы:
- Global Status — uptime, queries, connections
- InnoDB — buffer pool, transactions, locks
- Replication — slave status, lag
- Table Stats — размеры таблиц, количество строк
- Query Response Time — распределение времени запросов

## Конфигурация

Подключение к MySQL:
- Переменная окружения `DATA_SOURCE_NAME`
- Формат: `user:password@(hostname:port)/`

Пример:
```bash
export DATA_SOURCE_NAME='exporter:password@(localhost:3306)/'
```

Права пользователя MySQL:
```sql
CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'password';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'localhost';
```

## Запуск

Флаги:
- `--web.listen-address` — адрес:порт (default :9104)
- `--collect.info_schema.tables` — метрики таблиц
- `--collect.perf_schema.replication_group_members` — group replication
